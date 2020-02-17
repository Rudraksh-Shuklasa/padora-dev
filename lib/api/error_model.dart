class ErrorModel {
	Errors errors;
	String message;

	ErrorModel({this.errors, this.message});

	ErrorModel.fromJson(Map<String, dynamic> json) {
		errors =
		json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.errors != null) {
			data['errors'] = this.errors.toJson();
		}
		data['message'] = this.message;
		return data;
	}
}

class Errors {
	List<String> countryId;
	List<String> currencyId;
	List<String> fullName;
	List<String> languageId;

	Errors({this.countryId, this.currencyId, this.fullName, this.languageId});

	Errors.fromJson(Map<String, dynamic> json) {
		countryId = json['country_id'].cast<String>();
		currencyId = json['currency_id'].cast<String>();
		fullName = json['full_name'].cast<String>();
		languageId = json['language_id'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['country_id'] = this.countryId;
		data['currency_id'] = this.currencyId;
		data['full_name'] = this.fullName;
		data['language_id'] = this.languageId;
		return data;
	}
}