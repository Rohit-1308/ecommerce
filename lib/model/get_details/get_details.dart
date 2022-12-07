import 'dart:convert';

import 'package:collection/collection.dart';

class GetDetails {
  String? id;
  String? siteId;
  String? parentId;
  String? vendorId;
  String? catId;
  String? subCatId;
  String? childCatId;
  String? productTitle;
  String? brandName;
  String? description;
  String? label;
  String? suk;
  String? gst;
  String? status;
  String? views;
  String? cod;
  String? itemType;
  String? origin;
  String? manufacturer;
  String? packageType;
  String? packageDimensions;
  String? packageUnits;
  String? returnable;
  String? isExpirable;
  String? tnc;
  String? faqs;
  dynamic btbTerms;
  dynamic btbFaqs;
  String? warrantyDescription;
  String? packageIncludes;
  String? tags;
  String? verified;
  String? subUserId;
  String? orpId;
  String? postedBy;
  dynamic couponId;
  dynamic cashbackId;
  dynamic packageId;
  dynamic ewalletLimit;
  String? saveType;
  String? isCharitable;
  String? createdDate;
  String? productId;
  String? available;
  String? size;
  String? color;
  String? fabric;
  String? age;
  String? gender;
  String? measurement;
  String? package;
  String? style;
  String? series;
  String? unitPerPack;
  String? price;
  String? mrp;
  String? aStock;
  String? sStock;
  String? prodId;
  String? varId;
  String? variantImage;
  String? mainImage;
  String? generalDiscountPercent;
  String? generalDiscountFlat;
  dynamic membershipItemDiscountPercent;
  dynamic membershipItemDiscountFlat;
  dynamic membershipCategoryDiscountPercent;
  dynamic membershipCategoryDiscountFlat;
  dynamic membershipSubCategoryDiscountPercent;
  dynamic membershipSubCategoryDiscountFlat;

  GetDetails({
    this.id,
    this.siteId,
    this.parentId,
    this.vendorId,
    this.catId,
    this.subCatId,
    this.childCatId,
    this.productTitle,
    this.brandName,
    this.description,
    this.label,
    this.suk,
    this.gst,
    this.status,
    this.views,
    this.cod,
    this.itemType,
    this.origin,
    this.manufacturer,
    this.packageType,
    this.packageDimensions,
    this.packageUnits,
    this.returnable,
    this.isExpirable,
    this.tnc,
    this.faqs,
    this.btbTerms,
    this.btbFaqs,
    this.warrantyDescription,
    this.packageIncludes,
    this.tags,
    this.verified,
    this.subUserId,
    this.orpId,
    this.postedBy,
    this.couponId,
    this.cashbackId,
    this.packageId,
    this.ewalletLimit,
    this.saveType,
    this.isCharitable,
    this.createdDate,
    this.productId,
    this.available,
    this.size,
    this.color,
    this.fabric,
    this.age,
    this.gender,
    this.measurement,
    this.package,
    this.style,
    this.series,
    this.unitPerPack,
    this.price,
    this.mrp,
    this.aStock,
    this.sStock,
    this.prodId,
    this.varId,
    this.variantImage,
    this.mainImage,
    this.generalDiscountPercent,
    this.generalDiscountFlat,
    this.membershipItemDiscountPercent,
    this.membershipItemDiscountFlat,
    this.membershipCategoryDiscountPercent,
    this.membershipCategoryDiscountFlat,
    this.membershipSubCategoryDiscountPercent,
    this.membershipSubCategoryDiscountFlat,
  });

  @override
  String toString() {
    return 'GetDetails(id: $id, siteId: $siteId, parentId: $parentId, vendorId: $vendorId, catId: $catId, subCatId: $subCatId, childCatId: $childCatId, productTitle: $productTitle, brandName: $brandName, description: $description, label: $label, suk: $suk, gst: $gst, status: $status, views: $views, cod: $cod, itemType: $itemType, origin: $origin, manufacturer: $manufacturer, packageType: $packageType, packageDimensions: $packageDimensions, packageUnits: $packageUnits, returnable: $returnable, isExpirable: $isExpirable, tnc: $tnc, faqs: $faqs, btbTerms: $btbTerms, btbFaqs: $btbFaqs, warrantyDescription: $warrantyDescription, packageIncludes: $packageIncludes, tags: $tags, verified: $verified, subUserId: $subUserId, orpId: $orpId, postedBy: $postedBy, couponId: $couponId, cashbackId: $cashbackId, packageId: $packageId, ewalletLimit: $ewalletLimit, saveType: $saveType, isCharitable: $isCharitable, createdDate: $createdDate, productId: $productId, available: $available, size: $size, color: $color, fabric: $fabric, age: $age, gender: $gender, measurement: $measurement, package: $package, style: $style, series: $series, unitPerPack: $unitPerPack, price: $price, mrp: $mrp, aStock: $aStock, sStock: $sStock, prodId: $prodId, varId: $varId, variantImage: $variantImage, mainImage: $mainImage, generalDiscountPercent: $generalDiscountPercent, generalDiscountFlat: $generalDiscountFlat, membershipItemDiscountPercent: $membershipItemDiscountPercent, membershipItemDiscountFlat: $membershipItemDiscountFlat, membershipCategoryDiscountPercent: $membershipCategoryDiscountPercent, membershipCategoryDiscountFlat: $membershipCategoryDiscountFlat, membershipSubCategoryDiscountPercent: $membershipSubCategoryDiscountPercent, membershipSubCategoryDiscountFlat: $membershipSubCategoryDiscountFlat)';
  }

  factory GetDetails.fromMap(Map<String, dynamic> data) => GetDetails(
        id: data['id'] as String?,
        siteId: data['site_id'] as String?,
        parentId: data['parent_id'] as String?,
        vendorId: data['vendor_id'] as String?,
        catId: data['cat_id'] as String?,
        subCatId: data['sub_cat_id'] as String?,
        childCatId: data['child_cat_id'] as String?,
        productTitle: data['product_title'] as String?,
        brandName: data['brand_name'] as String?,
        description: data['description'] as String?,
        label: data['label'] as String?,
        suk: data['SUK'] as String?,
        gst: data['gst'] as String?,
        status: data['status'] as String?,
        views: data['views'] as String?,
        cod: data['cod'] as String?,
        itemType: data['item_type'] as String?,
        origin: data['origin'] as String?,
        manufacturer: data['manufacturer'] as String?,
        packageType: data['package_type'] as String?,
        packageDimensions: data['package_dimensions'] as String?,
        packageUnits: data['package_units'] as String?,
        returnable: data['returnable'] as String?,
        isExpirable: data['is_expirable'] as String?,
        tnc: data['tnc'] as String?,
        faqs: data['faqs'] as String?,
        btbTerms: data['btb_terms'] as dynamic,
        btbFaqs: data['btb_faqs'] as dynamic,
        warrantyDescription: data['warranty_description'] as String?,
        packageIncludes: data['package_includes'] as String?,
        tags: data['tags'] as String?,
        verified: data['verified'] as String?,
        subUserId: data['sub_user_id'] as String?,
        orpId: data['orp_id'] as String?,
        postedBy: data['posted_by'] as String?,
        couponId: data['coupon_id'] as dynamic,
        cashbackId: data['cashback_id'] as dynamic,
        packageId: data['package_id'] as dynamic,
        ewalletLimit: data['ewallet_limit'] as dynamic,
        saveType: data['save_type'] as String?,
        isCharitable: data['is_charitable'] as String?,
        createdDate: data['created_date'] as String?,
        productId: data['product_id'] as String?,
        available: data['available'] as String?,
        size: data['size'] as String?,
        color: data['color'] as String?,
        fabric: data['fabric'] as String?,
        age: data['age'] as String?,
        gender: data['gender'] as String?,
        measurement: data['measurement'] as String?,
        package: data['package'] as String?,
        style: data['style'] as String?,
        series: data['series'] as String?,
        unitPerPack: data['unit_per_pack'] as String?,
        price: data['price'] as String?,
        mrp: data['mrp'] as String?,
        aStock: data['a_stock'] as String?,
        sStock: data['s_stock'] as String?,
        prodId: data['prod_id'] as String?,
        varId: data['var_id'] as String?,
        variantImage: data['variant_image'] as String?,
        mainImage: data['main_image'] as String?,
        generalDiscountPercent: data['general_discount_percent'] as String?,
        generalDiscountFlat: data['general_discount_flat'] as String?,
        membershipItemDiscountPercent:
            data['membership_item_discount_percent'] as dynamic,
        membershipItemDiscountFlat:
            data['membership_item_discount_flat'] as dynamic,
        membershipCategoryDiscountPercent:
            data['membership_category_discount_percent'] as dynamic,
        membershipCategoryDiscountFlat:
            data['membership_category_discount_flat'] as dynamic,
        membershipSubCategoryDiscountPercent:
            data['membership_sub_category_discount_percent'] as dynamic,
        membershipSubCategoryDiscountFlat:
            data['membership_sub_category_discount_flat'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'site_id': siteId,
        'parent_id': parentId,
        'vendor_id': vendorId,
        'cat_id': catId,
        'sub_cat_id': subCatId,
        'child_cat_id': childCatId,
        'product_title': productTitle,
        'brand_name': brandName,
        'description': description,
        'label': label,
        'SUK': suk,
        'gst': gst,
        'status': status,
        'views': views,
        'cod': cod,
        'item_type': itemType,
        'origin': origin,
        'manufacturer': manufacturer,
        'package_type': packageType,
        'package_dimensions': packageDimensions,
        'package_units': packageUnits,
        'returnable': returnable,
        'is_expirable': isExpirable,
        'tnc': tnc,
        'faqs': faqs,
        'btb_terms': btbTerms,
        'btb_faqs': btbFaqs,
        'warranty_description': warrantyDescription,
        'package_includes': packageIncludes,
        'tags': tags,
        'verified': verified,
        'sub_user_id': subUserId,
        'orp_id': orpId,
        'posted_by': postedBy,
        'coupon_id': couponId,
        'cashback_id': cashbackId,
        'package_id': packageId,
        'ewallet_limit': ewalletLimit,
        'save_type': saveType,
        'is_charitable': isCharitable,
        'created_date': createdDate,
        'product_id': productId,
        'available': available,
        'size': size,
        'color': color,
        'fabric': fabric,
        'age': age,
        'gender': gender,
        'measurement': measurement,
        'package': package,
        'style': style,
        'series': series,
        'unit_per_pack': unitPerPack,
        'price': price,
        'mrp': mrp,
        'a_stock': aStock,
        's_stock': sStock,
        'prod_id': prodId,
        'var_id': varId,
        'variant_image': variantImage,
        'main_image': mainImage,
        'general_discount_percent': generalDiscountPercent,
        'general_discount_flat': generalDiscountFlat,
        'membership_item_discount_percent': membershipItemDiscountPercent,
        'membership_item_discount_flat': membershipItemDiscountFlat,
        'membership_category_discount_percent':
            membershipCategoryDiscountPercent,
        'membership_category_discount_flat': membershipCategoryDiscountFlat,
        'membership_sub_category_discount_percent':
            membershipSubCategoryDiscountPercent,
        'membership_sub_category_discount_flat':
            membershipSubCategoryDiscountFlat,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetDetails].
  factory GetDetails.fromJson(String data) {
    return GetDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetDetails) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      siteId.hashCode ^
      parentId.hashCode ^
      vendorId.hashCode ^
      catId.hashCode ^
      subCatId.hashCode ^
      childCatId.hashCode ^
      productTitle.hashCode ^
      brandName.hashCode ^
      description.hashCode ^
      label.hashCode ^
      suk.hashCode ^
      gst.hashCode ^
      status.hashCode ^
      views.hashCode ^
      cod.hashCode ^
      itemType.hashCode ^
      origin.hashCode ^
      manufacturer.hashCode ^
      packageType.hashCode ^
      packageDimensions.hashCode ^
      packageUnits.hashCode ^
      returnable.hashCode ^
      isExpirable.hashCode ^
      tnc.hashCode ^
      faqs.hashCode ^
      btbTerms.hashCode ^
      btbFaqs.hashCode ^
      warrantyDescription.hashCode ^
      packageIncludes.hashCode ^
      tags.hashCode ^
      verified.hashCode ^
      subUserId.hashCode ^
      orpId.hashCode ^
      postedBy.hashCode ^
      couponId.hashCode ^
      cashbackId.hashCode ^
      packageId.hashCode ^
      ewalletLimit.hashCode ^
      saveType.hashCode ^
      isCharitable.hashCode ^
      createdDate.hashCode ^
      productId.hashCode ^
      available.hashCode ^
      size.hashCode ^
      color.hashCode ^
      fabric.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      measurement.hashCode ^
      package.hashCode ^
      style.hashCode ^
      series.hashCode ^
      unitPerPack.hashCode ^
      price.hashCode ^
      mrp.hashCode ^
      aStock.hashCode ^
      sStock.hashCode ^
      prodId.hashCode ^
      varId.hashCode ^
      variantImage.hashCode ^
      mainImage.hashCode ^
      generalDiscountPercent.hashCode ^
      generalDiscountFlat.hashCode ^
      membershipItemDiscountPercent.hashCode ^
      membershipItemDiscountFlat.hashCode ^
      membershipCategoryDiscountPercent.hashCode ^
      membershipCategoryDiscountFlat.hashCode ^
      membershipSubCategoryDiscountPercent.hashCode ^
      membershipSubCategoryDiscountFlat.hashCode;
}
