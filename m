Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C49C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:02:40 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.58173.1697817751986005134
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 09:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjT1oZsJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf55a81eeaso7553605ad.0
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697817751; x=1698422551; darn=lists.yoctoproject.org;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6avisJyO+G2mte/5mbzuaEwyt8Coykd+e2Z8W8/jP8g=;
        b=JjT1oZsJ8O3KuhJDBQ8+8BEIwTOWE23feBp3cMODwYFbSUZ4L56Ly5g5ZTmRTzeTfH
         kThXctN2Cs2De1b+WwmnhIYExKWKrHjDUiKl39ZyjaA7A1ZW/WKHzo/mTZ4AEqYcrrCX
         FpvbUWH4PM3KogAU/5F+TsScWYjT4EjcOuFXZr4UbVYf9790Ds99BtkAtO722ApkRzde
         IZTKvJJoHkQCuPXCEnlnwr99X+wuHKYGijiHJ/gyndUtw08OXeFlLnsv6XhqyovCEJc9
         dO1LGj4BhqvZF1l386OjMplRxkefpHloMVvskaPVVsIkEkO8VrPGcY0vogsCE7xYAp3+
         jSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817751; x=1698422551;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6avisJyO+G2mte/5mbzuaEwyt8Coykd+e2Z8W8/jP8g=;
        b=n2/DNtNk0hz6dOm6Z5GSyF6BWcQDy8dyUk6+rvErt63c/dt5wColubx9Wxe6Pa38xF
         8BIDo7rjiIBwNeOL0Xvw7Jv3oYAuOpx2wsKLssvB5eIw6LV4HJ/6Rda2BaTCNJFXZyT7
         tzdmpjS5utPiEWYzcNLlreNqGnJSFM8oYyu1O+0UaY4T/yq7PPJyyBz4CJ6tFT/HF+e6
         SBed4G4AOpSWVAU9h1TeMVkeSMgEAhR0npCuKsfNgVDNU8fAEcKlyCEfOWZ8zhzUYi6U
         ZNWwcFtq6I42tWF59PmzVmN6hTaT3VuXin5txKBFUYuiAGCCRuxmODhWk4W4pYMLMuAW
         f3Cg==
X-Gm-Message-State: AOJu0Yzf2LD3Pvp4Ym4zvsmoYanXIFzn5YUN5hbZtyCEtT+HFcPTKpyj
	FlPOT2nPb5wg8r4CijDtcpE=
X-Google-Smtp-Source: AGHT+IHwCbq+yw9yKOxKXa/IgOYBWPP8mqnCl/JBMIoRfXk+NzppKhMyvZDllu4KOExD24RTLoAZ4w==
X-Received: by 2002:a17:903:2348:b0:1c9:bfd3:1f4a with SMTP id c8-20020a170903234800b001c9bfd31f4amr2254239plh.66.1697817751004;
        Fri, 20 Oct 2023 09:02:31 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:f423:bfba:96f6:f9d8? ([2601:646:9100:2cb0:f423:bfba:96f6:f9d8])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090274cc00b001a98f844e60sm1691684plt.263.2023.10.20.09.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 09:02:30 -0700 (PDT)
Message-ID: <72ce5635-5b2e-4c43-9b09-ffd7f436d4cb@gmail.com>
Date: Fri, 20 Oct 2023 09:02:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] ref-manual: variables: Add RECIPE_SYSROOT and
 RECIPE_SYSROOT_NATIVE
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>, docs@lists.yoctoproject.org
References: <20231020094102.414940-1-bhstalel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20231020094102.414940-1-bhstalel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YE21iGYjkVx5A2CgHfQJjzIP"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 16:02:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4447

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YE21iGYjkVx5A2CgHfQJjzIP
Content-Type: multipart/mixed; boundary="------------CQmjgef9Bo0oFdxdwmezyyM2";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: BELHADJ SALEM Talel <bhstalel@gmail.com>, docs@lists.yoctoproject.org
Message-ID: <72ce5635-5b2e-4c43-9b09-ffd7f436d4cb@gmail.com>
Subject: Re: [docs] [PATCH 1/3] ref-manual: variables: Add RECIPE_SYSROOT and
 RECIPE_SYSROOT_NATIVE
References: <20231020094102.414940-1-bhstalel@gmail.com>
In-Reply-To: <20231020094102.414940-1-bhstalel@gmail.com>

--------------CQmjgef9Bo0oFdxdwmezyyM2
Content-Type: multipart/mixed; boundary="------------fahdyxN9z4QkcLjd4GwriaHr"

--------------fahdyxN9z4QkcLjd4GwriaHr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjAvMjMgMjo0MSBBTSwgQkVMSEFESiBTQUxFTSBUYWxlbCB3cm90ZToNCj4gU2ln
bmVkLW9mZi1ieTogVGFsZWwgQkVMSEFKU0FMRU0gPGJoc3RhbGVsQGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICAgZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QgfCAzNSAr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFs
L3ZhcmlhYmxlcy5yc3QgYi9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibGVzLnJz
dA0KPiBpbmRleCAyNmE1YWVkODIuLmIwMDQ0NTk0NiAxMDA2NDQNCj4gLS0tIGEvZG9jdW1l
bnRhdGlvbi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4gKysrIGIvZG9jdW1lbnRhdGlv
bi9yZWYtbWFudWFsL3ZhcmlhYmxlcy5yc3QNCj4gQEAgLTY5NzEsNiArNjk3MSwzNiBAQCBz
eXN0ZW0gYW5kIGdpdmVzIGFuIG92ZXJ2aWV3IG9mIHRoZWlyIGZ1bmN0aW9uIGFuZCBjb250
ZW50cy4NCj4gICAgICAgICBpbiB0aGUgIjpyZWY6YHJlZi1tYW51YWwvZGV2dG9vbC1yZWZl
cmVuY2U6Y2hlY2tpbmcgb24gdGhlIHVwZ3JhZGUgc3RhdHVzIG9mIGEgcmVjaXBlYCINCj4g
ICAgICAgICBzZWN0aW9uLg0KPiAgIA0KPiArICAgOnRlcm06YFJFQ0lQRV9TWVNST09UYA0K
PiArICAgICAgVGhpcyB2YXJpYWJsZSBwb2ludHMgdG8gdGhlIGRpcmVjdG9yeSB0aGF0IGhv
bGRzIGFsbCBmaWxlcyBwb3B1bGF0ZWQgZnJvbQ0KPiArICAgICAgcmVjaXBlcyBzcGVjaWZp
ZWQgaW4gOnRlcm06YERFUEVORFNgLiBBcyB0aGUgbmFtZSBpbmRpY2F0ZXMsDQo+ICsgICAg
ICB0aGluayBvZiB0aGlzIHZhcmlhYmxlIGFzIGEgY3VzdG9tIHJvb3QgYGAvYGAgZm9yIHRo
ZSByZWNpcGUgdGhhdCB3aWxsIGJlDQo+ICsgICAgICB1c2VkIGJ5IHRoZSBjb21waWxlciBp
biBvcmRlciB0byBmaW5kIGhlYWRlcnMgYW5kIG90aGVyIGZpbGVzIG5lZWRlZCB0byBjb21w
bGV0ZQ0KPiArICAgICAgaXRzIGpvYi4NCg0KVGhhbmtzIGZvciBhZGRpbmcgdGhpcyB0byBk
b2NzLiBJIHRoaW5rIGl0IHdpbGwgYmUgZ29vZCB0byBtZW50aW9uIHRoYXQgDQp0aGlzIGlz
IG5vdCB0eXBpY2FsIHN5c3Jvb3Qgd2hlcmUgZXZlcnl0aGluZyBpcyBhdmFpbGFibGUgYnV0
IGl0cyBhIA0KbWltaW1hbCBzeXNyb290IHRoYXQgY29udGFpbnMgaGVhZGVycyBhbmQgbGli
cmFyaWVzIGZyb20gcmVjaXBlIHNwZWNpZmljIA0KYnVpbGQgdGltZSBkZXBlbmRlbmNpZXMg
b25seS4NCg0KPiArDQo+ICsgICAgICBUaGlzIHZhcmlhYmxlIGlzIHJlbGF0ZWQgdG8gOnRl
cm06YFNUQUdJTkdfRElSX0hPU1RgIG9yIDp0ZXJtOmBTVEFHSU5HX0RJUl9UQVJHRVRgDQo+
ICsgICAgICBhY2NvcmRpbmcgdG8gdGhlIHR5cGUgb2YgdGhlIHJlY2lwZSBhbmQgdGhlIGJ1
aWxkIHRhcmdldC4NCj4gKw0KPiArICAgICAgVG8gYmV0dGVyIHVuZGVyc3RhbmQgdGhpcyB2
YXJpYWJsZSwgY29uc2lkZXIgdGhlIGZvbGxvd2luZyBleGFtcGxlczoNCj4gKw0KPiArICAg
ICAgLSAgRm9yIGBgI2luY2x1ZGUgPGhlYWRlci5oPmBgLCBgYGhlYWRlci5oYGAgc2hvdWxk
IGJlIGluIGBgIiR7UkVDSVBFX1NZU1JPT1R9L3Vzci9pbmNsdWRlImBgDQo+ICsNCj4gKyAg
ICAgIC0gIEZvciBgYC1sZXhhbXBsZWBgLCBgYGxpYmV4YW1wbGUuc29gYCBzaG91bGQgYmUg
aW4gYGAiJHtSRUNJUEVfU1lTUk9PVH0vbGliImBgDQo+ICsgICAgICAgICBvciBvdGhlciBs
aWJyYXJ5IHN5c3Jvb3QgZGlyZWN0b3JpZXMuDQo+ICsNCj4gKyAgICAgIFRoZSBkZWZhdWx0
IHZhbHVlIGlzIGBgIiR7V09SS0RJUn0vcmVjaXBlLXN5c3Jvb3QiYGAuDQo+ICsgICAgICBE
byBub3QgbW9kaWZ5IGl0Lg0KPiArDQo+ICsgICA6dGVybTpgUkVDSVBFX1NZU1JPT1RfTkFU
SVZFYA0KPiArICAgICAgVGhpcyBpcyBzaW1pbGFyIHRvIDp0ZXJtOmBSRUNJUEVfU1lTUk9P
VGAgYnV0IHRoZSBwb3B1bGF0ZWQgZmlsZXMgYXJlIGZyb20NCj4gKyAgICAgIGBgLW5hdGl2
ZWBgIHJlY2lwZXMuIFRoaXMgYWxsb3dzIGEgcmVjaXBlIGJ1aWx0IGZvciB0aGUgdGFyZ2V0
IG1hY2hpbmUgdG8NCj4gKyAgICAgIHVzZSBgYG5hdGl2ZWBgIHRvb2xzLg0KPiArDQo+ICsg
ICAgICBUaGlzIHZhcmlhYmxlIGlzIHJlbGF0ZWQgdG8gOnRlcm06YFNUQUdJTkdfRElSX05B
VElWRWAuDQo+ICsNCj4gKyAgICAgIFRoZSBkZWZhdWx0IHZhbHVlIGlzIGBgIiR7V09SS0RJ
Un0vcmVjaXBlLXN5c3Jvb3QtbmF0aXZlImBgLg0KPiArICAgICAgRG8gbm90IG1vZGlmeSBp
dC4NCj4gKw0KPiAgICAgIDp0ZXJtOmBSRVBPRElSYA0KPiAgICAgICAgIFNlZSA6dGVybTpg
Yml0YmFrZTpSRVBPRElSYCBpbiB0aGUgQml0QmFrZSBtYW51YWwuDQo+ICAgDQo+IEBAIC04
Mjc1LDEwICs4MzA1LDE1IEBAIHN5c3RlbSBhbmQgZ2l2ZXMgYW4gb3ZlcnZpZXcgb2YgdGhl
aXIgZnVuY3Rpb24gYW5kIGNvbnRlbnRzLg0KPiAgICAgICAgICAgICAgIGZvciBgYC1uYXRp
dmVgYCByZWNpcGVzLCBhcyB0aGV5IG1ha2UgdXNlIG9mIGhvc3QgaGVhZGVycyBhbmQNCj4g
ICAgICAgICAgICAgICBsaWJyYXJpZXMuDQo+ICAgDQo+ICsgICAgICBDaGVjayA6dGVybTpg
UkVDSVBFX1NZU1JPT1RgIGFuZCA6dGVybTpgUkVDSVBFX1NZU1JPT1RfTkFUSVZFYC4NCj4g
Kw0KPiAgICAgIDp0ZXJtOmBTVEFHSU5HX0RJUl9OQVRJVkVgDQo+ICAgICAgICAgU3BlY2lm
aWVzIHRoZSBwYXRoIHRvIHRoZSBzeXNyb290IGRpcmVjdG9yeSB1c2VkIHdoZW4gYnVpbGRp
bmcNCj4gICAgICAgICBjb21wb25lbnRzIHRoYXQgcnVuIG9uIHRoZSBidWlsZCBob3N0IGl0
c2VsZi4NCj4gICANCj4gKyAgICAgIFRoZSBkZWZhdWx0IHZhbHVlIGlzIGBgIiR7UkVDSVBF
X1NZU1JPT1RfTkFUSVZFfSJgYCwNCj4gKyAgICAgIGNoZWNrIDp0ZXJtOmBSRUNJUEVfU1lT
Uk9PVF9OQVRJVkVgLg0KPiArDQo+ICAgICAgOnRlcm06YFNUQUdJTkdfRElSX1RBUkdFVGAN
Cj4gICAgICAgICBTcGVjaWZpZXMgdGhlIHBhdGggdG8gdGhlIHN5c3Jvb3QgdXNlZCBmb3Ig
dGhlIHN5c3RlbSBmb3Igd2hpY2ggdGhlDQo+ICAgICAgICAgY29tcG9uZW50IGdlbmVyYXRl
cyBjb2RlLiBGb3IgY29tcG9uZW50cyB0aGF0IGRvIG5vdCBnZW5lcmF0ZSBjb2RlLA0KPiAN
Cj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxp
bmUgKCM0NDM3KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvZG9jcy9tZXNz
YWdlLzQ0MzcNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVj
dC5vcmcvbXQvMTAyMDc3NzQ4LzE5OTc5MTQNCj4gR3JvdXAgT3duZXI6IGRvY3Mrb3duZXJA
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55
b2N0b3Byb2plY3Qub3JnL2cvZG9jcy91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------fahdyxN9z4QkcLjd4GwriaHr
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------fahdyxN9z4QkcLjd4GwriaHr--

--------------CQmjgef9Bo0oFdxdwmezyyM2--

--------------YE21iGYjkVx5A2CgHfQJjzIP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZTKklQUDAAAAAAAKCRC7BTNVkZ0zFKMe
AJ9zmvFGj62k2wtWOrcFm60pcALoJQCfZO0iMreKrtATPQ9w5Ew+X/q5qXw=
=Id6B
-----END PGP SIGNATURE-----

--------------YE21iGYjkVx5A2CgHfQJjzIP--

