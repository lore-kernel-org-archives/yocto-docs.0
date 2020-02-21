Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11762.1582305448652439737
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 09:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=caa+n/Ev;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1102; q=dns/txt; s=axis-central1;
  t=1582305449; x=1613841449;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RwCWJD/8cj9EefzUrSb4vuzZ2JpGAy6LYNnXhYavbR0=;
  b=caa+n/Ev1iiDVybL2SRfdziGPo+kI5GRLjfenzXrcOVV80ziKu6nwOhj
   aUH/G0gqCYY5GFayjmgYlrOj+hd1PtQ6bvt5B9DAfO4lC3HCCyUI27ZeA
   PmezJQfxF6e9anvIxZfObaRYu4z026LZ/+MyU9GswiKoV9hznwTrm20jf
   7M0MxFW1GhiDCgMtHOyW2LSEI9T+X5wkDYdXmIUjK7FeKJD/VmpVD5qSr
   twJUXcTm4SuYILvesLnVgX1ijzvEcEV0XZdSzKZqcvpq8+32LmaoD5pHb
   S6iyC73Sarvl8RkZ70jTI8XPFjgND4YW1AGzU/4buspx118SNc2z87Mk7
   Q==;
IronPort-SDR: ggZ6YdMC6uWaXrW0YuMicOa5U+SyhrkNr1yyVQYU6aQufT4pzyZrEZXOkZHv8Xf9lN1ws0jnQ2
 3FLS+iXbs0ynvWErPeqfTqdXZYD39wQhHL8nOvgQY4sKg9TkczyPaeXqc6d24hBr7h8GmQL+rn
 uqGlSVjwpg488PHHKwVAti0Ek2Sjq9c2zexR1H6yb6WntYFqzQLyG9OJZpQdjXa8+j0l8zg6Fo
 M6OQfHdszIaJrJDCQoMrKqJybfk1iv4RtCHyg6qAPFkdB3zHjxzBPkx2DY5zYbpgOIKO+9Z4ar
 wbU=
X-IronPort-AV: E=Sophos;i="5.70,469,1574118000"; 
   d="scan'208";a="5697497"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>, Michael Halstead
	<mhalstead@linuxfoundation.org>
Subject: Re: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
Thread-Topic: [docs] [Resend][PATCH 1/5] ref-manual: The sanity_info file has
 moved from build/conf to build/cache
Thread-Index: AQHV6Cw1PU+E0Wq/xEqYGDg+ewu5magkiWGAgAASkgCAAMQk4IAARicAgAA2n9CAAAf+0A==
Date: Fri, 21 Feb 2020 17:17:26 +0000
Message-ID: <ef2ab6aa8cfa4962a526dac1efb75853@XBOX03.axis.com>
References: <15F53638120140E5.26907@lists.yoctoproject.org>
	 <07b7e95db4ba4fa78b43bd7d143bdd94@XBOX03.axis.com>
	 <3ff7dc4ed4873535637626f5d1fd890622dd0165.camel@linuxfoundation.org>
	 <e114646f12554c00a661215288fba132@XBOX03.axis.com>
 <226adb62a27e36861c83abb7c2a73131e69d1655.camel@linuxfoundation.org>
 <15F57A48E3CAF9D8.9957@lists.yoctoproject.org>
In-Reply-To: <15F57A48E3CAF9D8.9957@lists.yoctoproject.org>
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
amVjdC5vcmcgPGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIFBl
dGVyIEtqZWxsZXJzdGVkdA0KPiBTZW50OiBkZW4gMjEgZmVicnVhcmkgMjAyMCAxODoxNQ0KPiBU
bzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ow0K
PiBkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IE1pY2hhZWwgSGFsc3RlYWQNCj4gPG1oYWxz
dGVhZEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0OiBSZTogW2RvY3NdIFtSZXNlbmRd
W1BBVENIIDEvNV0gcmVmLW1hbnVhbDogVGhlIHNhbml0eV9pbmZvIGZpbGUNCj4gaGFzIG1vdmVk
IGZyb20gYnVpbGQvY29uZiB0byBidWlsZC9jYWNoZQ0KDQpbY3V0XQ0KDQo+IFRoZSBxdWVzdGlv
biBub3cgaXMgaWYgdGhpcyB3YXMgYSB0ZW1wb3JhcnkgZ2xpdGNoIG9yIGlmIGl0IHdpbGwNCj4g
Y29udGludWUuIEFuZCBpZiBpdCB3YXMgYSBnbGl0Y2gsIGhhcyBncm91cHMuaW8gbWFya2VkIG15
IGFkZHJlc3MNCj4gYXMgInByb2JsZW1hdGljIiBhbmQgd2lsbCBjb250aW51ZSB0byBmb3J3YXJk
IG15IG1haWxzIHVzaW5nIHRoZQ0KPiB2aWEgYWRkcmVzcywgb3Igd2lsbCBpdCBnbyBiYWNrIHRv
IG5vcm1hbC4uLg0KDQpJIGd1ZXNzIHRoZSBoZWFkZXIgYWJvdmUgYW5zd2VycyB0aGF0LiBTZWVt
cyBJJ20gYmFjayBvbiB0aGUgZ29vZCANCnNlbmRlcnMgbGlzdCBhZ2Fpbi4gOikNCg0KLy9QZXRl
cg0KDQo=
