import 'package:arcopen_enquirer/http/requests/pay_subscription_request.dart';
import 'package:arcopen_enquirer/http/responses/active_plan_response.dart';
import 'package:arcopen_enquirer/http/responses/pay_subscription_response.dart';
import 'package:arcopen_enquirer/http/responses/subscriptions_response.dart';
import 'package:arcopen_enquirer/utils/repositories/base_repository.dart';
import 'package:dio/dio.dart';

class SubscriptionsRepository extends BaseRepository {
  final String basePath = "/subscriptions/api";

  Future<SubscriptionsResponse> getSubscriptionPlans() async {
    try {
      final Response response = await client.get(path: "$basePath/getPlans/");
      return SubscriptionsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<ActivePlanResponse> getActivePlan() async {
    try {
      final Response response = await client.get(path: "$basePath/getActivePlan/");
      return ActivePlanResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }

  Future<PaySubscriptionResponse> cardSubscription({required PaySubscriptionRequest request}) async {
    try {
      final Response response = await client.post(path: "$basePath/cardSubscription/", args: request.toFormData());
      return PaySubscriptionResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(this.extractErrorMessageFromDioError(e));
    }
  }
}
