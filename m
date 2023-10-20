Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3C6C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:04:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.58237.1697817889662841237
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 09:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nFbra5fQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ca82f015e4so7404505ad.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697817889; x=1698422689; darn=lists.yoctoproject.org;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIL39pedNT6yLLldmwz3dyHkzojFL7Uh6nf2mzlonhw=;
        b=nFbra5fQe579lDTmQSN38P8dcbtbDVzmk2TDMTmEUAJ4R9NEAZn9Fgzjv/kt34Dyje
         YgO4J9fd4/rX/EC0Q/NbeEYZgZ0ho9cttKcYWeDR985Ah+1B0DNG4oylku4f0/TEIIti
         FiSP4MgAsxUM0s+n0Wnqe5SRG5j/98h/EJUuEF3vjUhNLqPo4KqxOxIukBLsuKRWAsjH
         4R6XtWANW/nozRlWlXkMOaPegzBWWw77Kc6RsoWRCrIPDd8NQu7tKwqlNwHDBBugBv2t
         /ZOeAtTvS8ymsDq2HjFK21+0x3xz744zB96MLHjfzZpnDCC/pj6+8eFwkAANIX+eIl/H
         2r8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817889; x=1698422689;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QIL39pedNT6yLLldmwz3dyHkzojFL7Uh6nf2mzlonhw=;
        b=pstqk6+yuUOgqfn2l0VIl7soyDaKbhtlp+Iqnh8RekwfyYS6yc574R02zc3dFEauj8
         9EWix+Lv5tgIDBxecOJT6gY4muNJfx1xiZb92UrvSY3YO0GoG1zEVQU0CNdTubEl6SS4
         vfEXtIBELD2Nv/Q9fxVOyP90A3bq7IVcsb1F/XrUD9t8yZAsYV3l5YYMjl2aZHMvhAMZ
         36WEgUie88mlRrzdaJ3i9opZwdpJxVundt/VoDRmtbVLzIs3URa6pqavwo3DNfWkBNdH
         rPme1Mr7V+J7mbtzVw4Ui4Nc6CcolBfwx/wvxMrGRFkjcTJd5+5SVx0db4WalVeBOtbI
         rpzA==
X-Gm-Message-State: AOJu0Yx7vRBSX5Hak+tZU5+gzABLYPMwSWzRbXnvp70rikKAOX6Y3GZu
	VHYnVkZa4P7WPnbxle3AyALWnZmNg+A=
X-Google-Smtp-Source: AGHT+IFC77lq3GbQKhp8fwbIm3/oKjFrsYba/Sgxj/pcB2zFpwwx66cUGjRlAnTs7smXy3un+GyoHw==
X-Received: by 2002:a17:903:2115:b0:1ca:8169:e847 with SMTP id o21-20020a170903211500b001ca8169e847mr1802758ple.63.1697817888905;
        Fri, 20 Oct 2023 09:04:48 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:f423:bfba:96f6:f9d8? ([2601:646:9100:2cb0:f423:bfba:96f6:f9d8])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001ca4ad86369sm1694665plb.236.2023.10.20.09.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 09:04:48 -0700 (PDT)
Message-ID: <85b5fb7a-568f-4418-ae01-b74ccaab9501@gmail.com>
Date: Fri, 20 Oct 2023 09:04:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/3] ref-manual: variables: Add TOOLCHAIN_OPTIONS
 variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>, docs@lists.yoctoproject.org
References: <20231020094102.414940-1-bhstalel@gmail.com>
 <20231020094102.414940-2-bhstalel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20231020094102.414940-2-bhstalel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eT4zGteuNJd7rOjOQzRO3hv6"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 16:04:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4448

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eT4zGteuNJd7rOjOQzRO3hv6
Content-Type: multipart/mixed; boundary="------------Qm87Wh6puf0NJzoNp1eFR0RQ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: BELHADJ SALEM Talel <bhstalel@gmail.com>, docs@lists.yoctoproject.org
Message-ID: <85b5fb7a-568f-4418-ae01-b74ccaab9501@gmail.com>
Subject: Re: [docs] [PATCH 2/3] ref-manual: variables: Add TOOLCHAIN_OPTIONS
 variable
References: <20231020094102.414940-1-bhstalel@gmail.com>
 <20231020094102.414940-2-bhstalel@gmail.com>
In-Reply-To: <20231020094102.414940-2-bhstalel@gmail.com>

--------------Qm87Wh6puf0NJzoNp1eFR0RQ
Content-Type: multipart/mixed; boundary="------------6LBHEVdKnoqEBEmi45OuWTRl"

--------------6LBHEVdKnoqEBEmi45OuWTRl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjAvMjMgMjo0MSBBTSwgQkVMSEFESiBTQUxFTSBUYWxlbCB3cm90ZToNCj4gU2ln
bmVkLW9mZi1ieTogVGFsZWwgQkVMSEFKU0FMRU0gPGJoc3RhbGVsQGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICAgZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgfCAxMCAr
KysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJzdCBi
L2RvY3VtZW50YXRpb24vcmVmLW1hbnVhbC92YXJpYWJsZXMucnN0DQo+IGluZGV4IGIwMDQ0
NTk0Ni4uMWZjYTkxM2UyIDEwMDY0NA0KPiAtLS0gYS9kb2N1bWVudGF0aW9uL3JlZi1tYW51
YWwvdmFyaWFibGVzLnJzdA0KPiArKysgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFy
aWFibGVzLnJzdA0KPiBAQCAtOTEzNSw2ICs5MTM1LDE2IEBAIHN5c3RlbSBhbmQgZ2l2ZXMg
YW4gb3ZlcnZpZXcgb2YgdGhlaXIgZnVuY3Rpb24gYW5kIGNvbnRlbnRzLg0KPiAgICAgICAg
IHBvcnRpb24gb2YgYW4gZVNESy4gVGhpcyBpcyBzaW1pbGFyIHRvIDp0ZXJtOmBUT09MQ0hB
SU5fSE9TVF9UQVNLYA0KPiAgICAgICAgIGFwcGx5aW5nIHRvIFNES3MuDQo+ICAgDQo+ICsg
ICA6dGVybTpgVE9PTENIQUlOX09QVElPTlNgDQo+ICsgICAgICBUaGlzIHZhcmlhYmxlIGhv
bGRzIGV4dHJhIG9wdGlvbnMgcGFzc2VkIHRvIHRoZSBjb21waWxlciBhbmQgdGhlIGxpbmtl
cg0KDQpUaGlzIHdpbGwgYmUgZ29vZCB0byBtZW50aW9uIHRoYXQgaXRzIGRpZmZlcmVudCBm
cm9tIGFkZGluZyB0byBDRkxBR1MgDQpzaW5jZSB0aGlzIHZhcmlhYmxlIGVuZHMgdXAgaW4g
Q0MvQ1hYIHZhcmlhYmxlcyB3aGljaCBpcyBpbXBvcnRhbnQgdG8gDQprbm93IHRoYXQgaW4g
c29tZSBwYWNrYWdlcyBDRkxBR1MvTERGTEFHUyBtYXkgbm90IGJlIHVzZWQgZXNwZWNpYWxs
eSANCmR1cmluZyBjb25maWd1cmUgdGVzdHMgZXRjLg0KDQo+ICsgICAgICBmb3Igbm9uIGBg
LW5hdGl2ZWBgIHJlY2lwZXMgYXMgdGhleSBoYXZlIHRvIHBvaW50IHRvIHRoZWlyIGN1c3Rv
bQ0KPiArICAgICAgYGBzeXNyb290YGAgZm9sZGVyIHBvaW50ZWQgdG8gYnkgOnRlcm06YFJF
Q0lQRV9TWVNST09UYDo6DQo+ICsNCj4gKyAgICAgICAgIFRPT0xDSEFJTl9PUFRJT05TID0g
IiAtLXN5c3Jvb3Q9JHtSRUNJUEVfU1lTUk9PVH0iDQo+ICsNCj4gKyAgICAgIE5hdGl2ZSBy
ZWNpcGVzIGRvbid0IG5lZWQgdGhpcyB2YXJpYWJsZSB0byBiZSBzZXQsIGFzIHRoZXkgYXJl
DQo+ICsgICAgICBidWlsdCBmb3IgdGhlIGhvc3QgbWFjaGluZSB3aXRoIHRoZSBuYXRpdmUg
Y29tcGlsZXIuDQo+ICsNCj4gICAgICA6dGVybTpgVE9PTENIQUlOX09VVFBVVE5BTUVgDQo+
ICAgICAgICAgVGhpcyB2YXJpYWJsZSBkZWZpbmVzIHRoZSBuYW1lIHVzZWQgZm9yIHRoZSB0
b29sY2hhaW4gb3V0cHV0LiBUaGUNCj4gICAgICAgICA6cmVmOmBwb3B1bGF0ZV9zZGtfYmFz
ZSA8cmVmLWNsYXNzZXMtcG9wdWxhdGUtc2RrLSo+YCBjbGFzcyBzZXRzDQo+IA0KPiANCj4g
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwg
bWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzQ0
MzgpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9kb2NzL21lc3NhZ2UvNDQz
OA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9t
dC8xMDIwNzc3NTAvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogZG9jcytvd25lckBsaXN0cy55
b2N0b3Byb2plY3Qub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvZy9kb2NzL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------6LBHEVdKnoqEBEmi45OuWTRl
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------6LBHEVdKnoqEBEmi45OuWTRl--

--------------Qm87Wh6puf0NJzoNp1eFR0RQ--

--------------eT4zGteuNJd7rOjOQzRO3hv6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZTKlHwUDAAAAAAAKCRC7BTNVkZ0zFLX3
AJ9G9VkCv3OH0sgyG7i64z9d8CdmAACdFfjF80DCMy7PxgcdoKVA/CcUo2Q=
=sik9
-----END PGP SIGNATURE-----

--------------eT4zGteuNJd7rOjOQzRO3hv6--

