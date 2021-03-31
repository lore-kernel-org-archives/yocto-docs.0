Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.122.1617209054267404119
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=n0JXIqPR;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1617209054;
  x=1648745054;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3v85lkyoks3hUJA5rR4Za6oSq+g508BpaO0aKjSrCzg=;
  b=n0JXIqPR1fGbnR9Fzg30BKJbIlXGCI7vo3HXWAHB62pwuxnQK5gspMRp
   JMtgTHIZLhMU7qhuN0nCDV0+sCzl55BK8e2HhLNiTr3EFH1a0ze8Tx/Ys
   W1FCpwnkutyFca7v1xNvvr2kIDqMvnuy4afKjFFQTvwJQoYRAcbLaUask
   98/c5jP7bZy+g/EpaSnLPSJzlGQkkvEuMmaMuPRpXpHe1P9xCqvh5ZQIK
   xFbcb+tDYyiG4iE9Tqd+0/cQS0vs822VVjZdh8ViCoHTUvFXBcSemOYov
   d7C+xukppafCdsy2assXML/wJKVC2uliLBZVviL+Q78fyvRF7lOB00HoO
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
Thread-Topic: [docs] [PATCH 0/1] YP overview manual: style improvements
Thread-Index: AQHXJXk5oNvoGCpgsUWJAirWBtiRDKqcqii2///gCICAAAuvAIABtYrQgAADZCA=
Date: Wed, 31 Mar 2021 16:44:12 +0000
Message-ID: <b80f3ecedac04c8cb3ada50089d84983@XBOX03.axis.com>
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz>
 <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
 <603250fc-2501-32b9-66be-4d10c32545f0@bootlin.com>
 <16717AD05E03365C.31611@lists.yoctoproject.org>
In-Reply-To: <16717AD05E03365C.31611@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkb2NzQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIFBl
dGVyIEtqZWxsZXJzdGVkdA0KPiBTZW50OiBkZW4gMzEgbWFycyAyMDIxIDE4OjQwDQo+IFRvOiBN
aWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5hY2tlckBib290bGluLmNvbT4NCj4gQ2M6
IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtQQVRD
SCAwLzFdIFlQIG92ZXJ2aWV3IG1hbnVhbDogc3R5bGUgaW1wcm92ZW1lbnRzDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogZG9jc0BsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnIDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uDQo+IEJlaGFsZg0KPiA+IE9m
IE1pY2hhZWwgT3BkZW5hY2tlcg0KPiA+IFNlbnQ6IGRlbiAzMCBtYXJzIDIwMjEgMTg6MjUNCj4g
PiBUbzogTmljb2xhcyBEZWNoZXNuZSA8bmljb2xhcy5kZWNoZXNuZUBsaW5hcm8ub3JnPjsgUXVl
bnRpbiBTY2h1bHoNCj4gPiA8cXVlbnRpbi5zY2h1bHpAc3RyZWFtdW5saW1pdGVkLmNvbT4NCj4g
PiBDYzogZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gU3ViamVjdDogUmU6IFtkb2Nz
XSBbUEFUQ0ggMC8xXSBZUCBvdmVydmlldyBtYW51YWw6IHN0eWxlIGltcHJvdmVtZW50cw0KPiA+
DQo+ID4gSGkgTmljb2xhcywNCj4gPg0KPiA+IE9uIDMvMzAvMjEgNTo0MiBQTSwgTmljb2xhcyBE
ZWNoZXNuZSB3cm90ZToNCj4gPiA+IE9uIDMvMzAvMjEgNTozNiBQTSwgUXVlbnRpbiBTY2h1bHog
d3JvdGU6DQo+ID4gPg0KPiA+ID4gTG9va3MgZmluZSBmb3IgbWUgdG9vLg0KPiA+ID4gSG93ZXZl
ciBwbGVhc2UgYXZvaWQgY292ZXIgbGV0dGVyIHdoZW4geW91IGhhdmUganVzdCBvbmUgcGF0Y2gu
IFlvdQ0KPiA+ID4gY2FuIGFkZCBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIHdoZW4geW91IHNlbmQg
b25lIGVtYWlsLCBpZiB5b3UgYWRkIGl0DQo+ID4gPiBhZnRlciB0aGUgY29tbWl0IG1lc3NhZ2Ug
KGFmdGVyIHRoZSAtLS0pLCB0aGlzIHdpbGwgbm90IGJlIHVzZWQgd2hlbg0KPiA+ID4gYXBwbHlp
bmcgdGhlIHBhdGNoLg0KPiA+DQo+ID4NCj4gPiBWZXJ5IGdvb2QgdG8ga25vdyEgSSdsbCBkbyB0
aGF0IG5leHQgdGltZS4NCj4gPiBJbmRlZWQsIEkgZGlkbid0IHdhbnQgdG8gcHJvdmlkZSBzb21l
IGNvbnRleHQgYnkgcmVwbHlpbmcgdG8gbXkgcGF0Y2guDQo+ID4NCj4gPiBPciBtYXliZSBJJ20g
anVzdCBiZWluZyB0b28gdmVyYm9zZSA7LSkNCj4gPg0KPiA+IE1pY2hhZWwuDQo+IA0KPiBQbGVh
c2UgbWFrZSBzdXJlIHRvIHByZWZpeCB0aGUgY29tbWl0IHN1YmplY3RzIHdpdGggYSByZWxldmFu
dCBkb2N1bWVudA0KPiBvciBzaW1pbGFyLCBqdXN0IGxpa2Ugd2UgZG8gZm9yIGFsbCBjb21taXRz
IHRvLCBlLmcuLCBPRS1Db3JlLiBDb250cmFyeQ0KPiB0bywgZS5nLiwgY29tbWl0cyBpbiB0aGUg
Yml0YmFrZSByZXBvc2l0b3J5LCB0aGVyZSBpcyBubyBwcmVmaXggYWRkZWQNCj4gd2hlbiB0aGUg
Y29tbWl0cyB0byB0aGUgZG9jdW1lbnRhdGlvbiByZXBvc2l0b3J5IGFyZSBpbmNsdWRlZCBpbiBw
b2t5LA0KPiBtYWtpbmcgdGhlc2UgY29tbWl0IHN0YW5kIG91dCBhbmQgbGFja2luZyBjb250ZXh0
IHdoZW4gdXNpbmcsIGUuZy4sDQo+IGBnaXQgbG9nIC0tb25lbGluZWAuIExvb2sgYmFjayB0aHJv
dWdoIHRoZSBnaXQgbG9nIHRvIGdldCBleGFtcGxlcyBvZg0KPiBob3cgdGhpcyBoYXMgdHJhZGl0
aW9uYWxseSBiZWVuIGRvbmUuDQo+IA0KPiAvL1BldGVyDQoNCkFuZCBJIG9mIGNvdXJzZSBjaG9z
ZSBhIGJhZCBleGFtcGxlIG1haWwgdG8gcmVzcG9uZCB0byBhcyB0aGlzIG9uZSBhY3R1YWxseSAN
CmhhcyBhIHByZWZpeC4gOykNCg0KLy9QZXRlcg0KDQo=
