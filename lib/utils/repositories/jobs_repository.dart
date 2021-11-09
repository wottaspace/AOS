import 'package:arcopen_enquirer/constants/app_constants.dart';
import 'package:arcopen_enquirer/http/exceptions/request_exception.dart';
import 'package:arcopen_enquirer/http/requests/create_job_request.dart';
import 'package:arcopen_enquirer/http/responses/active_jobs_response.dart';
import 'package:arcopen_enquirer/http/responses/create_job_response.dart';
import 'package:arcopen_enquirer/http/responses/dispute_response.dart';
import 'package:arcopen_enquirer/http/responses/past_jobs_response.dart';
import 'package:arcopen_enquirer/http/responses/post_job_details.dart';
import 'package:arcopen_enquirer/http/responses/posted_jobs_response.dart';
import 'package:arcopen_enquirer/http/responses/remove_saved_member_response.dart';
import 'package:arcopen_enquirer/http/responses/saved_details_response.dart';
import 'package:arcopen_enquirer/utils/helpers/k_storage.dart';
import 'package:arcopen_enquirer/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JobsRepository extends BaseRepository {
  Future<PostedJobsResponse> getPostedJobs() async {
    try {
      Response response = await client.get(path: "/jobListings/");
      return PostedJobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<bool> rejectApplication(int id) async {
    try {
      await client.post(path: "/jobs/api/rejectApplication/$id");
      return true;
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<PostedJobsResponse> confirmApplication(int id) async {
    try {
      Response response = await client.get(path: "/jobListings/");
      return PostedJobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<JobDetailsResponse> getJobDetails(int id) async {
    try {
      Response response = await client.get(path: "/postedJobDetails/$id");
      return JobDetailsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<PastJobsResponse> getPastJobs() async {
    try {
      Response response = await client.get(path: "/pastProjects/");
      return PastJobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<ActiveJobsResponse> getActiveJobs() async {
    try {
      Response response = await client.get(path: "/activeProjects/");
      return ActiveJobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<SavedDetailsResponse> getSavedDetails() async {
    try {
      Response response = await client.get(path: "/savedDetails/");
      return SavedDetailsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<RemoveSavedMemberResponse> removeSavedMember({required int id}) async {
    try {
      Response response = await client.delete(path: "/removeSavedMember/$id");
      return RemoveSavedMemberResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<String> saveMember({required int memberId}) async {
    try {
      Response response = await client.post(path: "/saveMember/", args: {
        "member_id": memberId,
      });
      return response.data["message"];
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<CreateJobResponse> createJob(
      {required CreateJobRequest request}) async {
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.env["ENDPOINT"]!;

    try {
      final Response response = await dio.post("/jobs/api/job/",
          data: request.toJson(),
          options: Options(headers: {
            "Authorization": KStorage.read(key: AppConstants.accessTokenKey),
            "Content-Type": "multipart/form-data"
          }));
      return CreateJobResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<DisputeResponse> getDisputeJobs() async {
    try {
      Response response = await client.get(path: "/jobs/api/getDisputes");
      return DisputeResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<ActiveJobsResponse> loadMembers() async {
    try {
      Response response = await client.get(path: "/exploreMembers/");
      return ActiveJobsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<bool> inviteFriends({params}) async {
    try {
      await client.post(path: "/jobs/api/inviteGuard", args: params);
      return true;
    } on DioError catch (e) {
      throw new RequestException(this.extractErrorMessageFromDioError(e));
    }
  }
}
