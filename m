Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE73C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:52:48 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.32633.1641826366414980196
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 06:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=AhUDoSDd;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641826366;
  x=1673362366;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HSQa4Y5ADH+Nw7AC4nAsvCG7/qjEacpdECfvH+Qmku0=;
  b=AhUDoSDdALBH20voreFHhYBky7xBs0yni+Y59eG9eAyjU4xhfKsnKfBS
   7Co9rWf9iM+DnQm5grE3cZNwYhDlXpaqPy/o/WSl2K1Beo2T9DytwrGbX
   hz/QTQkkxmx3+oh+qHZ0IH7IhiFED2t5coa1y9KOHKB04IWDz0F4pEetK
   rlfWBlf3/9qogWKqLrDVCrI2RvjLk6w29RE/2Waww7wGoAwN8W0B50kCQ
   XwipwwckUu8pDYsiuien7bZ4rs1G/gi0HYVNjeWReov87g98JpYxXnzbh
   Osnn/gwXhaFDrwRJxw984Y7bCdm2lg1C+xFfERoG1pCUd/bihb3R7y4TS
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCHv3] ref-manual: Add documentation of
 PACKAGE_DEBUG_FILE_SUFFIX
Thread-Topic: [docs] [PATCHv3] ref-manual: Add documentation of
 PACKAGE_DEBUG_FILE_SUFFIX
Thread-Index: AQHYBi/WkftH/mJeyUOTD2B/NV4c3KxcVkcA
Date: Mon, 10 Jan 2022 14:52:43 +0000
Message-ID: <1057c8a51923484cb72ca4fc813d68c1@axis.com>
References: <20220107170433.1958-1-pkj@axis.com>
 <cd2aa2b1-7de3-aadb-bdb9-9471fab1f62b@bootlin.com>
In-Reply-To: <cd2aa2b1-7de3-aadb-bdb9-9471fab1f62b@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 14:52:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2368

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIE9wZGVuYWNrZXIg
PG1pY2hhZWwub3BkZW5hY2tlckBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDEwIGphbnVhcmkg
MjAyMiAxNTozOQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtk
b2NzXSBbUEFUQ0h2M10gcmVmLW1hbnVhbDogQWRkIGRvY3VtZW50YXRpb24gb2YgUEFDS0FHRV9E
RUJVR19GSUxFX1NVRkZJWA0KPiANCj4gT24gMS83LzIyIDY6MDQgUE0sIFBldGVyIEtqZWxsZXJz
dGVkdCB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVy
LmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPg0KPiA+IFBBVENIdjI6IFJlbW92
ZWQgdGhlIHJlZmVyZW5jZSB0byBzcGxpdF9hbmRfc3RyaXBfZmlsZXMoKS4NCj4gPiBQQVRDSHYz
OiBDaGFuZ2VkICJkYmcgcGFja2FnZSIgdG8gImBgLWRiZ2BgIHBhY2thZ2UiLg0KPiA+DQo+ID4g
IGRvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0IHwgOCArKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgYi9kb2N1bWVudGF0aW9uL3Jl
Zi1tYW51YWwvdmFyaWFibGVzLnJzdA0KPiA+IGluZGV4IGU4MWExMjAzMGEuLmFhYmEyM2RiZGYg
MTAwNjQ0DQo+ID4gLS0tIGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QN
Cj4gPiArKysgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdA0KPiA+IEBA
IC01MDg1LDYgKzUwODUsMTQgQEAgc3lzdGVtIGFuZCBnaXZlcyBhbiBvdmVydmlldyBvZiB0aGVp
ciBmdW5jdGlvbiBhbmQgY29udGVudHMuDQo+ID4gICAgICAgIHJlc3VsdCBvZiB0aGUgcGFja2Fn
ZSBtYW5hZ2VyIGluIHVzZSwgc2VlIHRoZQ0KPiA+ICAgICAgICAiOnJlZjpgcGFja2FnZS5iYmNs
YXNzIDxyZWYtY2xhc3Nlcy1wYWNrYWdlPmAiIHNlY3Rpb24uDQo+ID4NCj4gPiArICAgOnRlcm06
YFBBQ0tBR0VfREVCVUdfRklMRV9TVUZGSVhgDQo+ID4gKyAgICAgIFRoaXMgc3VmZml4IGlzIGFk
ZGVkIHRvIHRoZSBuYW1lcyBvZiBhbGwgZmlsZXMgd2l0aCBkZWJ1ZyBzeW1ib2xzIHRoYXQgZ28N
Cj4gPiArICAgICAgaW50byB0aGUgYGAtZGJnYGAgcGFja2FnZS4gSXQgY2FuIGJlIHVzZWQgdG8g
bWFrZSB0aGUgZGVidWcgZmlsZXMgcHJvZHVjZWQNCj4gPiArICAgICAgYnkgb25lIHJlY2lwZSB1
bmlxdWUgdG8gYXZvaWQgdGhlbSBjb25mbGljdGluZyB3aXRoIGlkZW50aWNhbGx5IG5hbWVkDQo+
ID4gKyAgICAgIGRlYnVnIGZpbGVzIHByb2R1Y2VkIGJ5IGFub3RoZXIgcmVjaXBlLiBUaGlzIG1h
eSBiZSBuZWVkZWQgc2luY2Ugd2hpbGUgdGhlDQo+ID4gKyAgICAgIHRhcmdldCBmaWxlcyBtYXkg
YmUgc3BsaXQgaW4gbXVsdGlwbGUgcGFja2FnZXMsIHRoZSBkZWJ1ZyBmaWxlcyBmb3Igb25lDQo+
ID4gKyAgICAgIHJlY2lwZSBhcmUgYWxsIGluIG9uZSBwYWNrYWdlLg0KPiA+ICsNCj4gPiAgICAg
OnRlcm06YFBBQ0tBR0VfREVCVUdfU1BMSVRfU1RZTEVgDQo+ID4gICAgICAgIERldGVybWluZXMg
aG93IHRvIHNwbGl0IHVwIGFuZCBwYWNrYWdlIGRlYnVnIGFuZCBzb3VyY2UgaW5mb3JtYXRpb24N
Cj4gPiAgICAgICAgd2hlbiBjcmVhdGluZyBkZWJ1Z2dpbmcgcGFja2FnZXMgdG8gYmUgdXNlZCB3
aXRoIHRoZSBHTlUgUHJvamVjdA0KPiANCj4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgT3BkZW5hY2tl
ciA8bWljaGFlbC5vcGRlbmFja2VyQGJvb3RsaW4uY29tPg0KPiAuLi4gYW5kIG1lcmdlZCBpbnRv
ICJtYXN0ZXItbmV4dCIuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCENCj4gTWljaGFlbC4N
Cg0KSnVzdCBiZSBhd2FyZSB0aGF0IGl0IHN0aWxsIGhhc24ndCBtYWRlIGl0IGludG8gbWV0YS4u
Lg0KDQovL1BldGVyDQoNCg==

