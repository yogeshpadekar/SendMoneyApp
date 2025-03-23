
"title": {
"en": "Send Money",
إرسال " :"ar"
"اﻷموال
,}
"services": [
{
"label": {
"en": "Bank Transfer"
,}
"name": "bank_transfer",
"providers": [
{
"name": "ABC Bank",
"id": "101",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Bank Account Number",
الحساب
رقم" :"ar"
"المصرفي
,}
"name": "bank_account_number",
"placeholder": null,
"type": "text",
"validation": "^[A-Za-z0-9 ]{1,64}$",
"max_length": "64",
"validation_error_message": "Bank account number is
required"
,}
{
"label": {
"en": "First name",
اﻻسم" :"ar"
"اﻷول
,}
"name": "firstname",
"placeholder": "Please enter first name",
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": "First name is required"
,}
{
"label": {
"en": "Last name",
اسم" :"ar"
"العائلة
,}
"name": "lastname",
"placeholder": "Please enter last name",
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": "Last name is required"
}
]
,}
{
"name": "XYZ Bank",
"id": "102",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
required"
,}
{
,}
{
,}
{
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
"label": {
"en": "Bank Account Number",
الحساب
رقم" :"ar"
"المصرفي
,}
"name": "bank_account_number",
"placeholder": null,
"type": "text",
"validation": "^[A-Za-z0-9 ]{1,64}$",
"max_length": "64",
"validation_error_message": "Bank account number is
"label": {
"en": "Full Name",
اﻻسم" :"ar"
"الكامل
,}
"name": "full_name",
"placeholder": {
"en": "Enter full name",
أدخل" :"ar"
"الكامل
اﻻسم
,}
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": {
"en": "Full name is required",
اﻻسم" :"ar"
" مطلوب
الكامل
}
"label": {
"en": "Province State",
"اﻹمارة" :"ar"
,}
"name": "province_state",
"placeholder": null,
"options": [
{
"label": "Abu Dhabi",
"name": "abu_dhabi"
,}
{
"label": "Dubai",
"name": "dubai"
}
,]
"type": "option",
"validation": "^[\\s\\S]*",
"max_length": ""
,
"validation_error_message": ""
}
]
,}
{
"name": "Global Bank",
"id": "103",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Bank Account Number",
الحساب
رقم" :"ar"
"المصرفي
,}
"name": "bank_account_number",
"placeholder": null,
"type": "text",
"validation": "^[A-Za-z0-9 ]{1,64}$",
"max_length": "64",
"validation_error_message": "Bank account number is
required"
,}
{
"label": {
"en": "Date of Birth (YYYY-MM-DD)",
-سنة
الميﻼد
تاريخ" :"ar"
") (يوم-شهر
,}
"name": "date_of_birth",
"placeholder": "YYYY-MM-DD",
"type": "text",
"validation":
"^(?:19|20)\\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$",
"max_length": ""
,
"validation_error_message": "Date of birth is required"
,}
{
"label": {
"en": "Gender",
"الجنس" :"ar"
,}
"name": "gender",
"placeholder": null,
"type": "option",
"options": [
{
"label": "Male",
"name": "M"
,}
{
"label": "Female",
"name": "F"
}
,]
"validation": "^[\\s\\S]*",
"max_length": ""
,
"validation_error_message": ""
}
]
,}
{
"name": "First Bank",
"id": "104",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Bank Account Number",
الحساب
رقم" :"ar"
"المصرفي
,}
"name": "bank_account_number",
"placeholder": null,
"type": "text",
"validation": "^[A-Za-z0-9 ]{1,64}$",
"max_length": "64",
"validation_error_message": "Bank account number is
required"
,}
{
"label": {
"en": "Last name",
اسم" :"ar"
"العائلة
,}
"name": "lastname",
"placeholder": "Please enter last name",
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": "Last name is required"
,}
{
"label": {
"en": "Gender",
"الجنس" :"ar"
,}
"name": "gender",
"placeholder": null,
"type": "option",
"options": [
{
"label": "Male",
"name": "M"
,}
{
"label": "Female",
"name": "F"
}
,]
"validation": "^[\\s\\S]*",
"max_length": ""
,
"validation_error_message": ""
}
]
,}
{
"name": "United Bank",
"id": "105",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Bank Account Number",
الحساب
رقم" :"ar"
"المصرفي
,}
"name": "bank_account_number",
"placeholder": null,
"type": "text",
"validation": "^[A-Za-z0-9 ]{1,64}$",
"max_length": "64",
"validation_error_message": "Bank account number is
required"
,}
{
"label": {
"en": "Last name",
اسم" :"ar"
"العائلة
,}
"name": "lastname",
"placeholder": "Please enter last name",
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": "Last name is required"
}
]
}
]
,}
{
"label": {
"en": "Wallet Transfer"
,}
"name": "wallet_transfer",
"providers": [
{
"name": "ABC Wallet",
"id": "501",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Mobile Number",
رقم" :"ar"
"المتحرك
الهاتف
,}
"name": "msisdn",
"placeholder": null,
"type": "msisdn",
"validation": "^\\+?[1-9][0-9]{6,14}$",
"max_length": "14",
"validation_error_message": "Mobile number is required"
,}
{
"label": {
"en": "First name",
اﻻسم" :"ar"
"اﻷول
,}
"name": "firstname",
"placeholder": "Please enter first name",
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": "First name is required"
,}
{
"label": {
"en": "Last name",
اسم" :"ar"
"العائلة
,}
"name": "lastname",
"placeholder": "Please enter last name",
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": "Last name is required"
}
]
,}
{
"name": "Quick Pay",
"id": "502",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Mobile Number",
رقم" :"ar"
"المتحرك
الهاتف
,}
"name": "msisdn",
"placeholder": null,
"type": "msisdn",
,}
{
,}
{
"validation": "^\\+?[1-9][0-9]{6,14}$",
"max_length": "14",
"validation_error_message": "Mobile number is required"
"label": {
"en": "Full Name",
اﻻسم" :"ar"
"الكامل
,}
"name": "full_name",
"placeholder": {
"en": "Enter full name",
أدخل" :"ar"
"الكامل
اﻻسم
,}
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": {
"en": "Full name is required",
اﻻسم" :"ar"
" مطلوب
الكامل
}
"label": {
"en": "Gender",
"الجنس" :"ar"
,}
"name": "gender",
"placeholder": null,
"type": "option",
"options": [
{
"label": "Male",
"name": "M"
,}
{
"label": "Female",
"name": "F"
}
,]
"validation": "^[\\s\\S]*",
"max_length": ""
,
"validation_error_message": ""
}
]
,}
{
"name": "Flash Wallet",
"id": "503",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Mobile Number",
رقم" :"ar"
"المتحرك
الهاتف
,}
"name": "msisdn",
"placeholder": null,
"type": "msisdn",
"validation": "^\\+?[1-9][0-9]{6,14}$",
"max_length": "14",
"validation_error_message": "Mobile number is required"
,}
{
"label": {
"en": "Province State",
"اﻹمارة" :"ar"
,}
"name": "province_state",
,}
{
}
]
,}
"placeholder": null,
"options": [
{
"label": "Abu Dhabi",
"name": "abu_dhabi"
,}
{
"label": "Dubai",
"name": "dubai"
,}
{
"label": "Sharjah",
"name": "sharjah"
}
,]
"type": "option",
"validation": "^[\\s\\S]*",
"max_length": ""
,
"validation_error_message": ""
"label": {
"en": "Full Name",
اﻻسم" :"ar"
"الكامل
,}
"name": "full_name",
"placeholder": {
"en": "Enter full name",
أدخل" :"ar"
"الكامل
اﻻسم
,}
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": {
"en": "Full name is required",
اﻻسم" :"ar"
" مطلوب
الكامل
}
{
"name": "Smart Pay",
"id": "504",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Mobile Number",
رقم" :"ar"
"المتحرك
الهاتف
,}
"name": "msisdn",
"placeholder": null,
"type": "msisdn",
"validation": "^\\+?[1-9][0-9]{6,14}$",
"max_length": "14",
"validation_error_message": "Mobile number is required"
,}
{
"label": {
"en": "Full Name",
اﻻسم" :"ar"
"الكامل
,}
"name": "full_name",
"placeholder": {
"en": "Enter full name",
أدخل" :"ar"
"الكامل
اﻻسم
,}
"type": "text",
"validation": "^[\\s\\S]*",
"max_length": 250,
"validation_error_message": {
"en": "Full name is required",
اﻻسم" :"ar"
" مطلوب
الكامل
}
}
]
,}
{
"name": "Easy Money",
"id": "505",
"required_fields": [
{
"label": {
"en": "Amount (AED)",
المبلغ" :"ar"
") (درهم
,}
"name": "amount",
"placeholder": "0.00",
"type": "number",
"validation": ""
,
"max_length": 0,
"validation_error_message": "Amount is required"
,}
{
"label": {
"en": "Mobile Number",
رقم" :"ar"
"المتحرك
الهاتف
,}
"name": "msisdn",
"placeholder": null,
"type": "msisdn",
"validation": "^\\+?[1-9][0-9]{6,14}$",
"max_length": "14",
"validation_error_message": "Mobile number is required"
,}
{
"label": {
"en": "Date of Birth (YYYY-MM-DD)",
-سنة
الميﻼد
تاريخ" :"ar"
") (يوم-شهر
},
"name": "date_of_birth",
"placeholder": "YYYY-MM-DD",
"type": "text",
"validation":
"^(?:19|20)\\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$",
"max_length": ""
"": null
,
}
]
}
]
}
]
}
