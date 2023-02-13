Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115D3C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 09:19:37 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10635.1676279967074634686
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 01:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eV1/HLhF;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1676279967;
  x=1707815967;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=g7PbcB83Gs71qFGiK1t96XmbUazKFEhrVGDBIuxX8EU=;
  b=eV1/HLhFTbDfy3Rxik8Hz4Hq9leYQykwZ/9A2n+JxFx0zdds+rGhq+2X
   cEYru0m0EXlVOZx4mc1NXdbT0TdxIbEjVh0dHmQBKdGptJ7g54PcVo8xO
   kHmwpcsOvNAnxuDTONhvAQpnCZJkRZcuHQthjKpTxwOuUEFOWP+iumFaV
   zvdi10AkxMI2R8NIZVenyTT5Y3ihgHrBmSgXs9rXMud2uEWlOKSlh/HWZ
   eLInHyzO5pwhj1BnVeKvfV0Ew0BVzt7ahEFir84z1/fHrwh420MoM+gti
   4ooWZ4Nyr4uTU99Zx0fKDUucZV5T8iJuVKxcvqWCyyIAUZJSW/dDszT/Q
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] ref-manual: add missing quotes
Thread-Topic: [docs] [PATCH] ref-manual: add missing quotes
Thread-Index: AQHZPytksOE4vRNqvkOa3fEaSOSYLa7MmHyA
Date: Mon, 13 Feb 2023 09:19:24 +0000
Message-ID: <4992cb7d98b942e2b0b54358bb38d707@axis.com>
References: <174331ACAD9BF3F3.21535@lists.yoctoproject.org>
 <6r7cwmpmot.fsf@pengutronix.de>
In-Reply-To: <6r7cwmpmot.fsf@pengutronix.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 09:19:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3667

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkb2NzQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFVscmlj
aCDDlmxtYW5uDQo+IFNlbnQ6IGRlbiAxMiBmZWJydWFyaSAyMDIzIDIyOjQ2DQo+IFRvOiBkb2Nz
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtkb2NzXSBbUEFUQ0hdIHJl
Zi1tYW51YWw6IGFkZCBtaXNzaW5nIHF1b3Rlcw0KPiANCj4gSGkgdGhlcmUsDQo+IA0KPiBPbiBT
dW4sIEZlYiAxMiAyMDIzIGF0IDIyOjQxICswMTAwLCBVbHJpY2ggw5ZsbWFubiA8dS5vZWxtYW5u
QHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBVbHJpY2ggw5ZsbWFu
biA8dS5vZWxtYW5uQHBlbmd1dHJvbml4LmRlPg0KPiA+IC0tLQ0KPiA+ICBkb2N1bWVudGF0aW9u
L3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdCB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jdW1l
bnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51
YWwvdmFyaWFibGVzLnJzdA0KPiA+IGluZGV4IGEzNmM0YzZkZjk2Mi4uYzU2MWFhZTY1NjNhIDEw
MDY0NA0KPiA+IC0tLSBhL2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0DQo+
ID4gKysrIGIvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4gPiBAQCAt
NDI3NSw3ICs0Mjc1LDcgQEAgc3lzdGVtIGFuZCBnaXZlcyBhbiBvdmVydmlldyBvZiB0aGVpciBm
dW5jdGlvbiBhbmQgY29udGVudHMuDQo+ID4gICAgICAgIFRvIHVzZSB0aGUgdmFyaWFibGUsIHNl
dCBpdCBpbiB0aGUgYXBwZW5kIGZpbGUgZm9yIHlvdXIga2VybmVsIHJlY2lwZQ0KPiA+ICAgICAg
ICB1c2luZyB0aGUgZm9sbG93aW5nIGZvcm06Og0KPiA+DQo+ID4gLSAgICAgICAgIEtCVUlMRF9E
RUZDT05GSUdfS01BQ0hJTkUgPz0gZGVmY29uZmlnX2ZpbGUNCj4gPiArICAgICAgICAgS0JVSUxE
X0RFRkNPTkZJR19LTUFDSElORSA/PSAiZGVmY29uZmlnX2ZpbGUiDQo+IA0KPiBJIGRpZCBub3Qg
ZmluZCBhbnkgb2NjdXJhbmNlIG9mIGEgdmFyaWFibGUgbmFtZWQgIktCVUlMRF9ERUZDT05GSUdf
DQo+IEtNQUNISU5FIiBpbiBrZXJuZWwteW9jdG8uYmJjbGFzcyBhbmQgZnJvbSB0aGUgYWJvdmUg
bGluZSdzIGNvbnRleHQgbXkNCj4gZmVlbGluZyBpcyB0aGF0IHRoZSBsYXN0IHVuZGVyc2NvcmUg
d2FzIG1lYW50IHRvIGJlIHRoZSBvbGQgb3ZlcnJpZGUNCj4gc3ludGF4IHdoaWNoIHNob3VsZCBi
ZSB1cGRhdGVkIHRvICI6IiBub3cuIElmIHRoaXMgaXMgY29ycmVjdCB0aGVuIEkNCj4gd291bGQg
YWRkaXRpb25hbGx5IGV4cGVjdCB0aGUgb3ZlcnJpZGUgbm90IHRvIGJlIEtNQUNISU5FIGJ1dCBN
QUNISU5FDQo+IGluc3RlYWQgYXMgb25seSB0aGUgbGF0dGVyIGlzIGEgdmFsaWQgb3ZlcnJpZGUu
IENvdWxkIHNvbWVvbmUgd2l0aCBtb3JlDQo+IGluc2lnaHQgcGxlYXNlIGNvbmZpcm0gb3IgcmVq
ZWN0IG15IHN1c3BpY2lvbj8NCj4gDQo+IEluIGNhc2Ugb2YgcG9zaXRpdmUgZmVlZGJhY2sgSSB3
b3VsZCBnbGFkbHkgc2VuZCBhbm90aGVyIHBhdGNoIGRvaW5nIGENCj4gDQo+ICAgcy9LQlVJTERf
REVGQ09ORklHX0tNQUNISU5FL0tCVUlMRF9ERUZDT05GSUc6TUFDSElORS8NCg0KSSBkb24ndCBr
bm93IHdoYXQgc3ludGF4IGlzIHVzZWQgaW4gdGhlIG1hbnVhbHMgZm9yIGluZGljYXRpbmcgdGhh
dCANCnNvbWV0aGluZyBpcyBleHBlY3RlZCB0byBiZSByZXBsYWNlZCBieSBhbiBhY3R1YWwgdmFs
dWUsIGJ1dCBJIHdvdWxkIA0KZXhwZWN0ZWQgaXQgdG8gYmUgc29tZXRoaW5nIGxpa2UgYEtCVUlM
RF9ERUZDT05GSUc6PG1hY2hpbmU+YCB0byANCmluZGljYXRlIHRoYXQgYW4gYWN0dWFsIG1hY2hp
bmUgbmFtZSBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIGluc3RlYWQgDQpvZiBgPG1hY2hpbmU+YC4N
Cg0KPiANCj4gdGhhdCBjaGFuZ2VzIGJvdGggb2NjdXJhbmNlcyBpbiByZWYtbWFudWFsL3Zhcmlh
Ymxlcy5yc3QgYW5kIGtlcm5lbC1kZXYvDQo+IGNvbW1vbi5yc3QuDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMNCj4gVWxyaWNoDQo+IA0KPiANCj4gPiAgICAgICAgSGVyZSBpcyBhbiBleGFtcGxlIGZyb20g
YSAicmFzcGJlcnJ5cGkyIiA6dGVybTpgS01BQ0hJTkVgIGJ1aWxkIHRoYXQgdXNlcw0KPiA+ICAg
ICAgICBhIGBgZGVmY29uZmlnYGAgZmlsZSBuYW1lZCAiYmNtMjcwOV9kZWZjb25maWciOjoNCj4g
LS0NCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVWxyaWNo
IMOWbG1hbm4gICAgICAgICAgICAgICB8DQo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAg
ICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8DQo+IFBlaW5lciBT
dHIuIDYtOCwgMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSB8IFBob25lOiArNDktNTEyMS0yMDY5
MTctMCAgICB8DQo+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8
IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8DQoNCi8vUGV0ZXINCg0K

