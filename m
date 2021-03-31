Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.67.1617208775665728587
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gKkNLf60;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1617208777;
  x=1648744777;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=osCR8cmojg3bX88wZtREomIYOIBagqMeQBI273tkQ7c=;
  b=gKkNLf60XVAmSDjaD/CZ61UEH4hv2238jHqmoqtK0UxfLo2dJ+LVrB5I
   URpL95tKERER5aH5OWFXsfsFo1deuhv4nWB36JO3bR794uNa7BCOaftqH
   iPN0VpubOCMOFTUP6LQ+LGoJbKQKJkhieCAAWYyrBriXAParpQkP5VRll
   t/zMeDTjmLc8mZD4DzhwGq+sf8Qfi57K11HeacYe+Q1z0zDFyTAWRajRH
   0CyrnW3fqgtaqxLRsmIudSncLjEM/Is9zjVJH40Y/1zJoAprnrjYRtlMl
   cCy8tZ3VJkZqqskBLX30bU1hBgxSOkrnRkvZU3EpGRG6fJXjushgJoXlN
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
Thread-Topic: [docs] [PATCH 0/1] YP overview manual: style improvements
Thread-Index: AQHXJXk5oNvoGCpgsUWJAirWBtiRDKqcqii2///gCICAAAuvAIABtYrQ
Date: Wed, 31 Mar 2021 16:39:32 +0000
Message-ID: <30690264b09d460b82b585322ebae090@XBOX03.axis.com>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz>
 <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
 <603250fc-2501-32b9-66be-4d10c32545f0@bootlin.com>
In-Reply-To: <603250fc-2501-32b9-66be-4d10c32545f0@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkb2NzQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIE1p
Y2hhZWwgT3BkZW5hY2tlcg0KPiBTZW50OiBkZW4gMzAgbWFycyAyMDIxIDE4OjI1DQo+IFRvOiBO
aWNvbGFzIERlY2hlc25lIDxuaWNvbGFzLmRlY2hlc25lQGxpbmFyby5vcmc+OyBRdWVudGluIFNj
aHVseg0KPiA8cXVlbnRpbi5zY2h1bHpAc3RyZWFtdW5saW1pdGVkLmNvbT4NCj4gQ2M6IGRvY3NA
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRDSCAwLzFd
IFlQIG92ZXJ2aWV3IG1hbnVhbDogc3R5bGUgaW1wcm92ZW1lbnRzDQo+IA0KPiBIaSBOaWNvbGFz
LA0KPiANCj4gT24gMy8zMC8yMSA1OjQyIFBNLCBOaWNvbGFzIERlY2hlc25lIHdyb3RlOg0KPiA+
IE9uIDMvMzAvMjEgNTozNiBQTSwgUXVlbnRpbiBTY2h1bHogd3JvdGU6DQo+ID4NCj4gPiBMb29r
cyBmaW5lIGZvciBtZSB0b28uDQo+ID4gSG93ZXZlciBwbGVhc2UgYXZvaWQgY292ZXIgbGV0dGVy
IHdoZW4geW91IGhhdmUganVzdCBvbmUgcGF0Y2guIFlvdQ0KPiA+IGNhbiBhZGQgYWRkaXRpb25h
bCBpbmZvcm1hdGlvbiB3aGVuIHlvdSBzZW5kIG9uZSBlbWFpbCwgaWYgeW91IGFkZCBpdA0KPiA+
IGFmdGVyIHRoZSBjb21taXQgbWVzc2FnZSAoYWZ0ZXIgdGhlIC0tLSksIHRoaXMgd2lsbCBub3Qg
YmUgdXNlZCB3aGVuDQo+ID4gYXBwbHlpbmcgdGhlIHBhdGNoLg0KPiANCj4gDQo+IFZlcnkgZ29v
ZCB0byBrbm93ISBJJ2xsIGRvIHRoYXQgbmV4dCB0aW1lLg0KPiBJbmRlZWQsIEkgZGlkbid0IHdh
bnQgdG8gcHJvdmlkZSBzb21lIGNvbnRleHQgYnkgcmVwbHlpbmcgdG8gbXkgcGF0Y2guDQo+IA0K
PiBPciBtYXliZSBJJ20ganVzdCBiZWluZyB0b28gdmVyYm9zZSA7LSkNCj4gDQo+IE1pY2hhZWwu
DQoNClBsZWFzZSBtYWtlIHN1cmUgdG8gcHJlZml4IHRoZSBjb21taXQgc3ViamVjdHMgd2l0aCBh
IHJlbGV2YW50IGRvY3VtZW50IA0Kb3Igc2ltaWxhciwganVzdCBsaWtlIHdlIGRvIGZvciBhbGwg
Y29tbWl0cyB0bywgZS5nLiwgT0UtQ29yZS4gQ29udHJhcnkgDQp0bywgZS5nLiwgY29tbWl0cyBp
biB0aGUgYml0YmFrZSByZXBvc2l0b3J5LCB0aGVyZSBpcyBubyBwcmVmaXggYWRkZWQgDQp3aGVu
IHRoZSBjb21taXRzIHRvIHRoZSBkb2N1bWVudGF0aW9uIHJlcG9zaXRvcnkgYXJlIGluY2x1ZGVk
IGluIHBva3ksIA0KbWFraW5nIHRoZXNlIGNvbW1pdCBzdGFuZCBvdXQgYW5kIGxhY2tpbmcgY29u
dGV4dCB3aGVuIHVzaW5nLCBlLmcuLCANCmBnaXQgbG9nIC0tb25lbGluZWAuIExvb2sgYmFjayB0
aHJvdWdoIHRoZSBnaXQgbG9nIHRvIGdldCBleGFtcGxlcyBvZiANCmhvdyB0aGlzIGhhcyB0cmFk
aXRpb25hbGx5IGJlZW4gZG9uZS4NCg0KLy9QZXRlcg0KDQoNCg==
