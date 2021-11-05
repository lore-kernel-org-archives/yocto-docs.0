Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED790C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:06:00 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.8497.1636131959581798348
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 10:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LUS5tRcu;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636131959;
  x=1667667959;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=X8nzFYD1b/C0LO8wwBaeu9Sj/TTZ9Bp0xQ6vb9Kk34Y=;
  b=LUS5tRcu33tSWTt14ie8ROoZXjpm5KPpVb1vljz1MwwxtamSSBl61kyq
   vDeWJJFar2j91VZJLi//8WsdbDDGyI/gmtDzCcMIZL8KRd9aMMp70QVRD
   HD7I8ssPJhyEEgSo+z0SUEitM884tGxx8fzj5ZpnxNgNsapcUhE9DaCwA
   uyFRZHHrmuavVy9iSY1/TrKd3ySHGMRs4BEdItKfGJgBYV1GUnpzd9bM0
   v41RxFWAluqTwFoVavWr0FP7Pb4eFOHehK/gWCrz4F8AiPySvQHT94maO
   LrLiDI5Wmhtf0Y4IEC3gUEjFYLcDimOiDVt5uuzRuYdUu8zvjgOA9xxqV
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] ref-manual: Document the EXTERNALSRC_EXTENSIONS
 variable
Thread-Topic: [docs] [PATCH] ref-manual: Document the EXTERNALSRC_EXTENSIONS
 variable
Thread-Index: AQHX0mELusoWLxaZEk+Inpwcbh22O6v1KZiQ
Date: Fri, 5 Nov 2021 17:05:51 +0000
Message-ID: <eb4c822bedea49c2b5c3890ce65e4a5a@axis.com>
References: <20211019170434.18700-1-pkj@axis.com>
 <16AFC7A64FAFF929.12113@lists.yoctoproject.org>
 <0a43a5b5-c146-281e-b5ba-78ee6a678200@bootlin.com>
In-Reply-To: <0a43a5b5-c146-281e-b5ba-78ee6a678200@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 17:06:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2096

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIE9wZGVuYWNrZXIg
PG1pY2hhZWwub3BkZW5hY2tlckBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDUgbm92ZW1iZXIg
MjAyMSAxNzoyMA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+Ow0KPiBkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6
IFtkb2NzXSBbUEFUQ0hdIHJlZi1tYW51YWw6IERvY3VtZW50IHRoZQ0KPiBFWFRFUk5BTFNSQ19F
WFRFTlNJT05TIHZhcmlhYmxlDQo+IA0KPiBIaSBQZXRlcg0KPiANCj4gT24gMTAvMjAvMjEgNTo0
NSBQTSwgTWljaGFlbCBPcGRlbmFja2VyIHdyb3RlOg0KPiA+IEhpIFBldGVyLA0KPiA+DQo+ID4g
VGhhbmtzIGZvciB0aGUgZG9jdW1lbnRhdGlvbiBwYXRjaCENCj4gPg0KPiA+IE9uIDEwLzE5LzIx
IDc6MDQgUE0sIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPj4gRVhURVJOQUxTUkNfRVhU
RU5TSU9OUyBpcyB1c2VkIHRvIHNwZWNpZnkgYWRkaXRpb25hbCBjbGFzc2VzIHRvIGluaGVyaXQN
Cj4gPj4gd2hlbiBleHRlcm5hbHNyYyBpcyBpbmhlcml0ZWQuDQo+ID4+DQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5hY2tlckBi
b290bGluLmNvbT4NCj4gPiBXYWl0aW5nIGZvciB5b3VyIHBhdGNoIHRvIGJlIGFjY2VwdGVkIGlu
IE9FLWNvcmUgYmVmb3JlIG1lcmdpbmcgaW4NCj4gPiBtYXN0ZXItbmV4dC4NCj4gDQo+IEFwcGFy
ZW50bHksIHlvdXIgY29kZSBoYXNuJ3QgYmVlbiBtZXJnZWQgeWV0LCBhbmQgZm9sbG93aW5nIHRo
ZQ0KPiBkaXNjdXNzaW9ucyBvbiBPRS1jb3JlLCBJJ20gbm90IHN1cmUgd2hhdCB0byBleHBlY3Qu
DQo+IFdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgbWUgdGhlIHBhdGNoIGFnYWluIHdoZW4gc29tZXRo
aW5nIGhhcHBlbnM/DQoNCkJhc2VkIG9uIHRoZSBjb21tZW50cyB0aGF0IHRoZSBwYXRjaCByZWNl
aXZlZCBJIHdpbGwgbm90IHB1c2ggZm9yIA0KaXQgdG8gYmUgaW50ZWdyYXRlZC4gV2Ugd2lsbCB1
c2UgYSBsb2NhbCBzb2x1dGlvbiBpbnN0ZWFkLg0KDQo+IFRoYW5rcyBmb3IgZXZlcnl0aGluZw0K
PiBNaWNoYWVsLg0KPiANCj4gLS0NCj4gTWljaGFlbCBPcGRlbmFja2VyLCBCb290bGluDQo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNv
bQ0KDQovL1BldGVyDQoNCg==

