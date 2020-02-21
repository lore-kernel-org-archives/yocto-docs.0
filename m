Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.6421.1582277384735831120
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 01:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=he2P2XQ3;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2878; q=dns/txt; s=axis-central1;
  t=1582277385; x=1613813385;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Q0QUGRYOJZRlksWd3l5dW1j2CpvVwsGkfCwf4lVeig8=;
  b=he2P2XQ3udnDolEHzd/0I/XVcysAit/Wb22N/FCwpdZOgeHutmOZr43r
   7Sodq+nucjYFjrLkr2gVvK98OJCsyavGXAniiOLt3ZcWsYho7jhE4BAlO
   Vp/j185Hbtxy7WHMf7VshBT7Ot8jMVhbkQHv8NC/1EVFx4Tbl5hHrCSGV
   sPzzQOfhx9Ewt5j5JtqXCC6xzlMywo43Pd4fND6OpdaTytvc7XTL3R/n5
   hH3aQ3Xifr0vi44FxrKO++xiza3vjmXaEVFwoPlxZXZLxfqYVPKfgIGAr
   Bq8WgY+Vk2afEHfbgJL2iiNQdbSiJLVM6iYV75L3Jz43MLSfxYYRai7Y8
   g==;
IronPort-SDR: 8bozP6WCqfQ36AC45dLUASez0WsJuGeNibobqWVJgyT/JGj/UUFv1SiS02zrUVaZq/oxQWeHih
 rMQ1tsdKZRSwv99xQ5Rzncf6z+3+Fz9UzINr3Qxcmz7Kdsn+6IiRFC3m7e7/CE3ChqhYP0mxr3
 L241G/5M75/tmZP2sJsdsOrpWXyW0TA2kt2E7xnpDANmSyzJ2cK5M0QGHW3OfJezUTJvqc0Tu7
 Vel2Qk/G6qngxlLzgMfSFyLhHrGvc7xJNRmiQJWklydwD6Ef5do0+/gQgvjQqaSoDzeHUvUJWV
 M1k=
X-IronPort-AV: E=Sophos;i="5.70,467,1574118000"; 
   d="scan'208";a="5516738"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, Michael Halstead
	<mhalstead@linuxfoundation.org>
Subject: Re: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
Thread-Topic: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has
 moved from build/conf to build/cache
Thread-Index: AQHV6Cw1PU+E0Wq/xEqYGDg+ewu5magkiWGAgAASkgCAAMQk4A==
Date: Fri, 21 Feb 2020 09:29:37 +0000
Message-ID: <e114646f12554c00a661215288fba132@XBOX03.axis.com>
References: <15F53638120140E5.26907@lists.yoctoproject.org>
	 <07b7e95db4ba4fa78b43bd7d143bdd94@XBOX03.axis.com>
 <3ff7dc4ed4873535637626f5d1fd890622dd0165.camel@linuxfoundation.org>
In-Reply-To: <3ff7dc4ed4873535637626f5d1fd890622dd0165.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDIwIGZlYnJ1YXJp
IDIwMjAgMjM6MzkNCj4gVG86IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsgTWljaGFlbCBI
YWxzdGVhZA0KPiA8bWhhbHN0ZWFkQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBQZXRlciBLamVsbGVy
c3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtk
b2NzXSBbUmVzZW5kXVtQQVRDSCAxLzVdIHJlZi1tYW51YWw6IFRoZSBzYW5pdHlfaW5mbyBmaWxl
DQo+IGhhcyBtb3ZlZCBmcm9tIGJ1aWxkL2NvbmYgdG8gYnVpbGQvY2FjaGUNCj4gDQo+IE9uIFRo
dSwgMjAyMC0wMi0yMCBhdCAyMDo0MiArMDAwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYQ0KPiBM
aXN0cy5Zb2N0b3Byb2plY3QuT3JnIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8ZG9jc0BsaXN0
cy55b2N0b3Byb2plY3Qub3JnPg0KPiA+ID4gT24gQmVoYWxmIE9mIFBldGVyIEtqZWxsZXJzdGVk
dA0KPiA+ID4gdmlhIExpc3RzLllvY3RvcHJvamVjdC5PcmcgPA0KPiA+ID4gcGV0ZXIua2plbGxl
cnN0ZWR0PWF4aXMuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+ID4NCj4gPiBeXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl4NCj4gPiBeXl5eXl5eXl5eDQo+ID4gV2h5IGRpZCB0aGF0IGhhcHBlbj8gV2hlbiBJIHNl
bnQgdGhlIHNhbWUgcGF0Y2hlcyAxMCBkYXlzIGFnbyB0bw0KPiA+IHRoZSBzYW1lIGRlc3RpbmF0
aW9uLCBteSBhZGRyZXNzIGNhbWUgb3V0IG5vcm1hbCB3aXRob3V0IHRoZSB2aWENCj4gPiAoSSBy
ZXNlbnQgdGhlIHBhdGNoZXMgYmVjYXVzZSB0aGV5IGhhZCBub3QgYXBwZWFyZWQgaW4gUGF0Y2h3
b3JrKS4NCj4gPg0KPiA+IFRoZSByZWFzb24gSSBhc2sgaXMgYmVjYXVzZSBJIGV4cGVjdCB0aGlz
IGdpdmVzIG1lIGEgc2VwYXJhdGUNCj4gPiBlbnRyeSBpbiBQYXRjaHdvcmsgZm9yIHRoaXMgYWRk
cmVzcyBjb21wYXJlZCB0byBteSBub3JtYWwgZW50cnksDQo+ID4gd2hpY2ggY29tcGxpY2F0ZXMg
dGhpbmdzIHdoZW4gSSB3YW50IHRvIHNlYXJjaCBmb3IgbXkgb3BlbiBwYXRjaGVzLg0KPiA+IFNv
IGlmIHBvc3NpYmxlIEkgd291bGQgbGlrZSB0byBhdm9pZCB0aGlzIGluIHRoZSBmdXR1cmUuLi4N
Cj4gDQo+IEl0IGNvbWVzIGRvd24gdG8gdGhlIHJ1bGVzIHlvdXIgY29tcGFueSBzZXQgZm9yIHRo
ZSBkb21haW4geW91J3JlDQo+IHNlbmRpbmcgZnJvbS4gSWYgdGhlIG1haWxpbmcgbGlzdCBpc24n
dCBhbGxvd2VkIHRvIGZvcndhcmQgeW91ciBtZXNzYWdlDQo+IGl0cyBmb3JjZWQgdG8gcmV3cml0
ZSB0aGUgRnJvbSBhZGRyZXNzIHRvIHNvbWV0aGluZyB3aGljaCBpdCBjYW4gc2VuZA0KPiBmcm9t
Lg0KPiANCj4gRGlkIHNvbWV0aGluZyBpbiB5b3VyIGRvbWFpbidzIERNQVJDIHNldHRpbmdzIGNo
YW5nZT8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KTm90IGFzIGZhciBhcyBJIGtu
b3cuIEkgYW0gYWJzb2x1dGVseSBubyBleHBlcnQgb24gbWFpbCBhbmQgRE1BUkMsIA0Kc28gSSBn
b29nbGVkIERNQVJDIGFuZCBmb3VuZDoNCg0KICBodHRwczovL3d3dy5kbWFyY2FuYWx5emVyLmNv
bS9kbWFyYy9kbWFyYy1yZWNvcmQtY2hlY2svDQoNCldoZW4gSSBjaGVjayBvdXIgZG9tYWluIChh
eGlzLmNvbSkgdGhlcmUsIEkgZ2V0IHRoZSBmb2xsb3dpbmc6DQoNCiAgdj1ETUFSQzE7IHA9bm9u
ZTsgc3A9bm9uZTsgcGN0PTEwMDsgcnVhPW1haWx0bzpkbWFyY3JlcG9ydHNAYXhpcy5jb207IHJ1
Zj1tYWlsdG86ZG1hcmNyZXBvcnRzQGF4aXMuY29tDQoNCkFuZCBpZiBJIHVuZGVyc3RhbmQgdGhh
dCBjb3JyZWN0bHksIGl0IHNob3VsZCBub3QgYmUgYSBwcm9ibGVtIA0KZm9yIGZvcndhcmRpbmcg
bWFpbHMgZnJvbSBtZS4NCg0KQW55IG90aGVyIGlkZWFzPw0KDQovL1BldGVyDQoNCg==
