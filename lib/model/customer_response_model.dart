// To parse this JSON data, do
//
//     final customerLoginResponseModel = customerLoginResponseModelFromJson(jsonString);

import 'dart:convert';

CustomerLoginResponseModel customerLoginResponseModelFromJson(String str) => CustomerLoginResponseModel.fromJson(json.decode(str));

String customerLoginResponseModelToJson(CustomerLoginResponseModel data) => json.encode(data.toJson());

class CustomerLoginResponseModel {
    CustomerLoginResponseModel({
        this.code,
        this.message,
        this.data,
        this.loanPlans,
        this.sitings,
        this.stats,
    });

    final int? code;
    final String? message;
    final UserData? data;
    final List<LoanPaymentPlan>? loanPlans;
    final List<MainCustomerSiting>? sitings;
    final Stats? stats;

    factory CustomerLoginResponseModel.fromJson(Map<String, dynamic> json) => CustomerLoginResponseModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        loanPlans: json["loan_plans"] == null ? [] : List<LoanPaymentPlan>.from(json["loan_plans"]!.map((x) => LoanPaymentPlan.fromJson(x))),
        sitings: json["sitings"] == null ? [] : List<MainCustomerSiting>.from(json["sitings"]!.map((x) => MainCustomerSiting.fromJson(x))),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
        "loan_plans": loanPlans == null ? [] : List<dynamic>.from(loanPlans!.map((x) => x.toJson())),
        "sitings": sitings == null ? [] : List<dynamic>.from(sitings!.map((x) => x.toJson())),
        "stats": stats?.toJson(),
    };
}

class UserData {
    UserData({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.userType,
        this.deviceToken,
        this.sitings,
        this.installerId,
        this.profileImage,
        this.isVerified,
        this.isActive,
        this.isLocked,
        this.isDeleted,
        this.recieveNotifications,
        this.isProfileComplete,
        this.token,
    });

     String? id;
     String? firstName;
     String? lastName;
     String? email;
     String? phone;
     String? userType;
     String? deviceToken;
     List<String>? sitings;
     String? installerId;
     String? profileImage;
     bool? isVerified;
     bool? isActive;
     bool? isLocked;
     bool? isDeleted;
     bool? recieveNotifications;
     bool? isProfileComplete;
     String? token;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        userType: json["user_type"],
        deviceToken: json["device_token"],
        sitings: json["sitings"] == null ? [] : List<String>.from(json["sitings"]!.map((x) => x)),
        installerId: json["installer_id"],
        profileImage: json["profile_image"],
        isVerified: json["is_verified"],
        isActive: json["is_active"],
        isLocked: json["is_locked"],
        isDeleted: json["is_deleted"],
        recieveNotifications: json["recieve_notifications"],
        isProfileComplete: json["is_profile_complete"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "user_type": userType,
        "device_token": deviceToken,
        "sitings": sitings == null ? [] : List<dynamic>.from(sitings!.map((x) => x)),
        "installer_id": installerId,
        "profile_image": profileImage,
        "is_verified": isVerified,
        "is_active": isActive,
        "is_locked": isLocked,
        "is_deleted": isDeleted,
        "recieve_notifications": recieveNotifications,
        "is_profile_complete": isProfileComplete,
        "token": token,
    };
}

class LoanPaymentPlan {
    LoanPaymentPlan({
        this.index,
        this.paymentStatus,
        this.dueDate,
        this.paidDate,
        this.monthlyPayout,
        this.id,
    });

    final int? index;
    final String? paymentStatus;
    final DateTime? dueDate;
    final dynamic paidDate;
    final int? monthlyPayout;
    final String? id;

    factory LoanPaymentPlan.fromJson(Map<String, dynamic> json) => LoanPaymentPlan(
        index: json["index"],
        paymentStatus: json["payment_status"],
        dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        paidDate: json["paid_date"],
        monthlyPayout: json["monthly_payout"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "payment_status": paymentStatus,
        "due_date": dueDate?.toIso8601String(),
        "paid_date": paidDate,
        "monthly_payout": monthlyPayout,
        "_id": id,
    };
}

class MainCustomerSiting {
    MainCustomerSiting({
        this.report,
        this.loanAmountToBeIssued,
        this.id,
        this.siteAddress,
        this.addressType,
        this.country,
        this.state,
        this.maintenance,
        this.grandTotal,
        this.isActive,
        this.equipmentrequests,
        this.installerId,
        this.sizingId,
        this.siteName,
        this.consumerName,
        this.consumerId,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.installercosts,
        this.sitingId,
    });

    final MainCustomerSiteReport? report;
    final int? loanAmountToBeIssued;
    final String? id;
    final String? siteAddress;
    final String? addressType;
    final String? country;
    final String? state;
    final String? maintenance;
    final int? grandTotal;
    final bool? isActive;
    final List<String>? equipmentrequests;
    final String? installerId;
    final String? sizingId;
    final String? siteName;
    final String? consumerName;
    final String? consumerId;
    final String? phone;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final List<dynamic>? installercosts;
    final String? sitingId;

    factory MainCustomerSiting.fromJson(Map<String, dynamic> json) => MainCustomerSiting(
        report: json["report"] == null ? null : MainCustomerSiteReport.fromJson(json["report"]),
        loanAmountToBeIssued: json["loan_amount_to_be_issued"],
        id: json["_id"],
        siteAddress: json["site_address"],
        addressType: json["address_type"],
        country: json["country"],
        state: json["state"],
        maintenance: json["maintenance"],
        grandTotal: json["grand_total"],
        isActive: json["is_active"],
        equipmentrequests: json["equipmentrequests"] == null ? [] : List<String>.from(json["equipmentrequests"]!.map((x) => x)),
        installerId: json["installer_id"],
        sizingId: json["sizing_id"],
        siteName: json["site_name"],
        consumerName: json["consumer_name"],
        consumerId: json["consumer_id"],
        phone: json["phone"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        installercosts: json["installercosts"] == null ? [] : List<dynamic>.from(json["installercosts"]!.map((x) => x)),
        sitingId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "report": report?.toJson(),
        "loan_amount_to_be_issued": loanAmountToBeIssued,
        "_id": id,
        "site_address": siteAddress,
        "address_type": addressType,
        "country": country,
        "state": state,
        "maintenance": maintenance,
        "grand_total": grandTotal,
        "is_active": isActive,
        "equipmentrequests": equipmentrequests == null ? [] : List<dynamic>.from(equipmentrequests!.map((x) => x)),
        "installer_id": installerId,
        "sizing_id": sizingId,
        "site_name": siteName,
        "consumer_name": consumerName,
        "consumer_id": consumerId,
        "phone": phone,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "installercosts": installercosts == null ? [] : List<dynamic>.from(installercosts!.map((x) => x)),
        "id": sitingId,
    };
}

class MainCustomerSiteReport {
    MainCustomerSiteReport({
        this.message,
        this.images,
    });

    final String? message;
    final List<dynamic>? images;

    factory MainCustomerSiteReport.fromJson(Map<String, dynamic> json) => MainCustomerSiteReport(
        message: json["message"],
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}

class Stats {
    Stats({
        this.totalLoan,
        this.totalLoanPaid,
    });

    final int? totalLoan;
    final int? totalLoanPaid;

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        totalLoan: json["total_loan"],
        totalLoanPaid: json["total_loan_paid"],
    );

    Map<String, dynamic> toJson() => {
        "total_loan": totalLoan,
        "total_loan_paid": totalLoanPaid,
    };
}







