Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.49698.1617585394240544328
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Apr 2021 18:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xzy5wtRDrgW0/t4uU1I+//cGWpWOO0Qic+usITJWBzpfJ1Ey1SCXI4abSMYE+1LQ/I3QAnX0xN
 a2xUDoh5rh3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9944"; a="256738518"
X-IronPort-AV: E=Sophos;i="5.81,305,1610438400"; 
   d="scan'208";a="256738518"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2021 18:16:28 -0700
IronPort-SDR: cvmbKhDhf5eqerJun0AQwO7J7AWhWWxFflMMwH4omJCU3gJzFioMagPXYgfV5sLkRB7oWV4iwq
 wefdjSegBjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,305,1610438400"; 
   d="scan'208";a="417788656"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2021 18:16:27 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 5 Apr 2021 09:16:26 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Mon, 5 Apr 2021 09:16:26 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>,
	"mhalstead@linuxfoundation.org" <mhalstead@linuxfoundation.org>
CC: "rpurdie@linuxfoundation.org" <rpurdie@linuxfoundation.org>,
	"nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH] releases: update to include 3.2.3
Thread-Topic: [docs] [PATCH] releases: update to include 3.2.3
Thread-Index: AQHXKA/LgIyFkWGJAEaycBUR6v0BXaqknFuA
Date: Mon, 5 Apr 2021 01:16:26 +0000
Message-ID: <bcee72baa511ae69997ad5d182e96f0838fc29b8.camel@intel.com>
References: <20210402223011.309701-1-mhalstead@linuxfoundation.org>
In-Reply-To: <20210402223011.309701-1-mhalstead@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <891B3A57CB8EE843861B1E5D68CE42D4@intel.com>
Content-Transfer-Encoding: base64

SGkgTWljaGFlbCwNCg0KT24gRnJpLCAyMDIxLTA0LTAyIGF0IDE1OjMwIC0wNzAwLCBNaWNoYWVs
IEhhbHN0ZWFkIHdyb3RlOg0KPiBVcGRhdGluZyB0byBidWlsZCAzLjIuMyBkb2NzIGFuZCBhZGQg
bWlzc2luZyAzLjAuNCByZWxlYXNlIGxpbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IEhhbHN0ZWFkIDxtaGFsc3RlYWRAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gLS0tDQo+IMKgZG9j
dW1lbnRhdGlvbi9wb2t5LnlhbWzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
NiArKystLS0NCj4gwqBkb2N1bWVudGF0aW9uL3JlbGVhc2VzLnJzdMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAyICsrDQo+IMKgZG9jdW1lbnRhdGlvbi9zcGhpbngtc3RhdGljL3N3aXRj
aGVycy5qcyB8IDIgKy0NCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3Bva3kueWFtbCBi
L2RvY3VtZW50YXRpb24vcG9reS55YW1sDQo+IGluZGV4IDNjMzBjNDQzMC4uZGUyNjRjOTYzIDEw
MDY0NA0KPiAtLS0gYS9kb2N1bWVudGF0aW9uL3Bva3kueWFtbA0KPiArKysgYi9kb2N1bWVudGF0
aW9uL3Bva3kueWFtbA0KPiBAQCAtMSwxMiArMSwxMiBAQA0KPiAtRElTVFJPIDogIjMuMi4yIg0K
PiArRElTVFJPIDogIjMuMi4zIg0KPiDCoERJU1RST19OQU1FX05PX0NBUCA6ICJnYXRlc2dhcnRo
Ig0KPiDCoERJU1RST19OQU1FIDogIkdhdGVzZ2FydGgiDQo+IMKgRElTVFJPX05BTUVfTk9fQ0FQ
X01JTlVTX09ORSA6ICJkdW5mZWxsIg0KPiDCoERJU1RST19OQU1FX05PX0NBUF9MVFMgOiAiZHVu
ZmVsbCINCj4gLVlPQ1RPX0RPQ19WRVJTSU9OIDogIjMuMi4yIg0KPiArWU9DVE9fRE9DX1ZFUlNJ
T04gOiAiMy4yLjMiDQo+IMKgWU9DVE9fRE9DX1ZFUlNJT05fTUlOVVNfT05FIDogIjMuMS42Ig0K
PiDCoERJU1RST19SRUxfVEFHIDogInlvY3RvLTMuMi4yIg0KDQpTaG91bGQgdGhpcyBiZSB5b2N0
by0zLjIuMz8NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gLVBPS1lWRVJTSU9OIDogIjI0LjAuMiIN
Cj4gK1BPS1lWRVJTSU9OIDogIjI0LjAuMyINCj4gwqBZT0NUT19QT0tZIDogInBva3ktJkRJU1RS
T19OQU1FX05PX0NBUDstJlBPS1lWRVJTSU9OOyINCj4gwqBZT0NUT19ETF9VUkwgOiAiaHR0cHM6
Ly9kb3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZyINCj4gwqBZT0NUT19BQl9VUkwgOiAiaHR0cHM6
Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnIg0KPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRh
dGlvbi9yZWxlYXNlcy5yc3QgYi9kb2N1bWVudGF0aW9uL3JlbGVhc2VzLnJzdA0KPiBpbmRleCBj
NDg2NTI1M2YuLjZhNjViOWZiMyAxMDA2NDQNCj4gLS0tIGEvZG9jdW1lbnRhdGlvbi9yZWxlYXNl
cy5yc3QNCj4gKysrIGIvZG9jdW1lbnRhdGlvbi9yZWxlYXNlcy5yc3QNCj4gQEAgLTExLDYgKzEx
LDcgQEANCj4gwqAtIDp5b2N0b19kb2NzOmAzLjIgRG9jdW1lbnRhdGlvbiA8LzMuMj5gDQo+IMKg
LSA6eW9jdG9fZG9jczpgMy4yLjEgRG9jdW1lbnRhdGlvbiA8LzMuMi4xPmANCj4gwqAtIDp5b2N0
b19kb2NzOmAzLjIuMiBEb2N1bWVudGF0aW9uIDwvMy4yLjI+YA0KPiArLSA6eW9jdG9fZG9jczpg
My4yLjMgRG9jdW1lbnRhdGlvbiA8LzMuMi4zPmANCj4gwqANCj4gwqAqKioqKioqKioqKioqKioq
KioqKioqKioqKioqDQo+IMKgMy4xICdkdW5mZWxsJyBSZWxlYXNlIFNlcmllcw0KPiBAQCAtMzYs
NiArMzcsNyBAQA0KPiDCoC0gOnlvY3RvX2RvY3M6YDMuMC4xIERvY3VtZW50YXRpb24gPC8zLjAu
MT5gDQo+IMKgLSA6eW9jdG9fZG9jczpgMy4wLjIgRG9jdW1lbnRhdGlvbiA8LzMuMC4yPmANCj4g
wqAtIDp5b2N0b19kb2NzOmAzLjAuMyBEb2N1bWVudGF0aW9uIDwvMy4wLjM+YA0KPiArLSA6eW9j
dG9fZG9jczpgMy4wLjQgRG9jdW1lbnRhdGlvbiA8LzMuMC40PmANCj4gwqANCj4gwqAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqDQo+IMKgMi43ICd3YXJyaW9yJyBSZWxlYXNlIFNlcmllcw0K
PiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9zcGhpbngtc3RhdGljL3N3aXRjaGVycy5qcw0K
PiBiL2RvY3VtZW50YXRpb24vc3BoaW54LXN0YXRpYy9zd2l0Y2hlcnMuanMNCj4gaW5kZXggYTdj
MzQ4YTdiLi43YTRlZGM5ZTcgMTAwNjQ0DQo+IC0tLSBhL2RvY3VtZW50YXRpb24vc3BoaW54LXN0
YXRpYy9zd2l0Y2hlcnMuanMNCj4gKysrIGIvZG9jdW1lbnRhdGlvbi9zcGhpbngtc3RhdGljL3N3
aXRjaGVycy5qcw0KPiBAQCAtMyw3ICszLDcgQEANCj4gwqANCj4gwqDCoCB2YXIgYWxsX3ZlcnNp
b25zID0gew0KPiDCoMKgwqDCoCAnZGV2JzogJ2RldiAoMy4zKScsDQo+IC3CoMKgwqAgJzMuMi4y
JzogJzMuMi4yJywNCj4gK8KgwqDCoCAnMy4yLjMnOiAnMy4yLjMnLA0KPiDCoMKgwqDCoCAnMy4x
LjYnOiAnMy4xLjYnLA0KPiDCoMKgwqDCoCAnMy4wLjQnOiAnMy4wLjQnLA0KPiDCoMKgwqDCoCAn
Mi43LjQnOiAnMi43LjQnLA0KPiANCj4gDQo+IA0KDQo=
