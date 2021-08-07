Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.2841.1628307207707589341
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 20:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Em6w2Hkd;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1628307208;
  x=1659843208;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iURbH5LmR++gQo2NczAfX5YhQKiBukHRotS4K6UA5hw=;
  b=Em6w2HkdbOZhnw1p9C+UzEws0pyWLxGVwEnogkbghNWwI40LORkrdIaC
   aedRN+9RQ2TCX2q1DTJ/pw0fqwKKXvjNNsKPOf5w18vrRYLhESnjJOKBd
   Wq4inXmo3lj84Ty1JT85GFqwbkdbbBVIPYbuQA5CJmChPl4qOm8FJj85d
   sPpTqTcUjfQhF/OhxJHHioaSiI6e6oGDZKoPdgCHtjN/FrG78cOisVBq8
   M4waaLBKj3v7k1Tk4ioiaZT959zfXSIUXZ+dCJdngzRb0SJKRJePHMCZ8
   2/L1gXoVyWyI7Ij2bUSjCvu1S4WKAkdnsXLJvBUCCWHI0MjnDg5OBk452
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	<quentin.schulz@theobroma-systems.com>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] manuals: further documentation for cve-check
Thread-Topic: [docs] [PATCH] manuals: further documentation for cve-check
Thread-Index: AQHXiq8OhapuQKUorUy16/XrBuW7W6tmOQWAgABY0eKAAM8M4A==
Date: Sat, 7 Aug 2021 03:33:24 +0000
Message-ID: <d1d6b6d2e58b47b4a506f305403b5546@axis.com>
References: <20210806103720.50047-1-michael.opdenacker@bootlin.com>
 <20210806114113.4453gl435gtde7xy@fedora>
 <1698BCAA59B53D79.17952@lists.yoctoproject.org>
 <a822bc10-12fa-8a68-3c22-d81c98b1672f@bootlin.com>
In-Reply-To: <a822bc10-12fa-8a68-3c22-d81c98b1672f@bootlin.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkb2NzQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIE1p
Y2hhZWwgT3BkZW5hY2tlcg0KPiBTZW50OiBkZW4gNiBhdWd1c3RpIDIwMjEgMTY6NTkNCj4gVG86
IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekB0aGVvYnJvbWEtc3lzdGVtcy5jb20+DQo+
IENjOiBkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtkb2NzXSBb
UEFUQ0hdIG1hbnVhbHM6IGZ1cnRoZXIgZG9jdW1lbnRhdGlvbiBmb3IgY3ZlLWNoZWNrDQo+IA0K
PiBIZWxsbyBRdWVudGluLA0KPiANCj4gUHJlZW1wdGl2ZSBuaXRwaWNraW5nIDstKQ0KPiANCj4g
T24gOC82LzIxIDQ6MDUgUE0sIE1pY2hhZWwgT3BkZW5hY2tlciB3cm90ZToNCj4gPg0KPiA+PiBT
aW5jZSBDVkUgc3RhbmRzIGZvciAiQ29tbW9uIFZ1bG5lcmFiaWxpdGllcyBhbmQgRXhwb3N1cmVz
IiwgaXNuJ3QNCj4gPj4gYWRkaW5nIHZ1bG5lcmFiaWxpdGllcyByZWR1bmRhbnQ/DQoNCk5vdCBt
dWNoIGRpZmZlcmVudCBmcm9tIHVzaW5nLCBlLmcuLCAiYSBDRCBkaXNjIi4gOykgDQoNCj4gPiBP
aCB5ZXMsIGFncmVlZCENCj4gDQo+IFdvcnNlLCBDVkUgaXMgYWxyZWFkeSBhIHBsdXJhbCBhY3Jv
bnltLiBTbywgd2Ugc2hvdWxkIHVzZSAiQ1ZFIiBpbnN0ZWFkDQo+IG9mICJDVkVzIiwgb3RoZXJ3
aXNlIHdlJ3JlIG1ha2luZyBhIG11bHRpLXBsdXJhbCEgSSdtIHN1cmUgeW91IHdvdWxkDQo+IGhh
dmUgZW5kZWQgdXAgbm90aWNpbmcgdGhpcy4NCg0KVGhhdCBkb2Vzbid0IG1ha2Ugc2Vuc2UuIEkg
d291bGQgYXJndWUgdGhhdCAiYSBDVkUiIGlzIHNpbmd1bGFyIGFuZCByZWZlcnMgDQp0byBvbmUg
ZW50cnkgaW4gdGhlIENWRSBkYXRhYmFzZSwgcmVnYXJkbGVzcyBvZiB3aGF0IHRoZSBhY3Jvbnlt
IGFjdHVhbGx5IA0Kc3RhbmRzIGZvci4gVGh1cyAiYnVncyBhbmQgQ1ZFcyIgbWFrZSBzZW5zZSwg
d2hpbGUgImJ1Z3MgYW5kIENWRSIgZG9lcyBub3QuDQoNCj4gRm9ydHVuYXRlbHksIG5vdCBhbGwg
cmVhZGVycyBhcmUgbGlrZSB5b3UsIGJ1dCB0aG9zZSBhcmUgdGhlIGJlc3Qgb25lcyA6LVANCj4g
Q2hlZXJzLA0KPiBNaWNoYWVsLg0KDQovL1BldGVyDQoNCg==
