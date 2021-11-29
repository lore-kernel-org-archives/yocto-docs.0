Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CC3C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 07:50:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.58148.1638172233544174260
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Nov 2021 23:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P3bS0/tG;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: simon.eu@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so13404238pjb.5
        for <docs@lists.yoctoproject.org>;
 Sun, 28 Nov 2021 23:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=uj/8FCbE6M6rFn7sCYwd5m0BwoZW95lyXVWx6e/9alo=;
        b=P3bS0/tGgAJ7AReliy/NxnrEhjWBAE8ORiKzPmO3uNsNwcgjwJ20n2PI75cUts8Cgp
         CvO3jUy0n7EdMWBbICbya8qtUU5c8NlmJUVPVhr4+6zI/8R9l/gWH49KNFaU8wwgKFcJ
         QY2JL/6pEKCSAm3SrISt2wSXcmPS6P+Wx7L3SjXEZ5ZAA4I76CXXLuk+zLJPklKPI2SX
         WD7puW68sHWtk6DleaknM+pna1sN0aXS5JuyvcFAz2Lw0l6k+eCUhj0wv1yF1MQwSQQj
         t4N9q2ur/tKba7p5YFWZi183bxdz0jBZxKEt7IbsgWXkwTfxStjgXr8x3gqWJx8d7Ut7
         R06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=uj/8FCbE6M6rFn7sCYwd5m0BwoZW95lyXVWx6e/9alo=;
        b=FaAJa+RjBEuCeyLR8yp+6Ic8xhqvDmxf8SMg4TJGcXGcOkGdquiSiJ4F8BwrIlSCUp
         jk/0wzVswft/K+nHswrlTlwrGTY7PYnJFka+xfsA5EBniplAHQYkgY164B0IKd4ij0Xu
         KKyX08RZEShs2XWBaWsTsAXcvK+LaykryPf1dpxugZoUV4sDPCgm60pq7fKsfc65xfC2
         YM+5GHByghARQ5iP8SEo9Bkx6Ahkba9UFMdX9ZRJYZ8N0gO0FwWLQynpYx9ZSy/TZKsI
         Pq1mpG5QiiSfPA12ix7JFqT/XxpBevQ32ByIjdQ30OD81asmXP+Kvv7f1WjWMgbKZVuv
         WjXQ==
X-Gm-Message-State: AOAM530b3U6dV9Xi8b5TkLrBcS7u3US5SmhqYv54uPrriDeZAaEtUcrB
	e1t/ogOmyR5xBVPGjc06q6y3ujM6dQODP0pkbjf7aDpa
X-Google-Smtp-Source: 
 ABdhPJw+T66dTPbYKbqEIIhegOtzYtuAyBXhYN2lyJhOR5sZiyeU0FWOgeeoc+UfIfC8DC9UqoFDmFdkt8+7mZJ6WBI=
X-Received: by 2002:a17:90a:f2c2:: with SMTP id
 gt2mr29019236pjb.178.1638172232721;
 Sun, 28 Nov 2021 23:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20211115124546.97456-1-simon.eu@gmail.com>
 <09f9337d978b9d0727de2a937eb417e8185ca0b3.camel@linuxfoundation.org>
 <16B7BA9296511776.16692@lists.yoctoproject.org>
In-Reply-To: <16B7BA9296511776.16692@lists.yoctoproject.org>
From: Simon Eugster <simon.eu@gmail.com>
Date: Mon, 29 Nov 2021 08:50:21 +0100
Message-ID: 
 <CAO8d5Ba4SJ_SeK2y+qHcGWqxVWjDL=buaOcYxcGXDmhYZg3MGA@mail.gmail.com>
Subject: Re: [docs] [PATCH v3] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: docs@lists.yoctoproject.org
Content-Type: multipart/mixed; boundary="000000000000033da605d1e8b23d"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Nov 2021 07:50:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2207

--000000000000033da605d1e8b23d
Content-Type: multipart/alternative; boundary="000000000000033da505d1e8b23b"

--000000000000033da505d1e8b23b
Content-Type: text/plain; charset="UTF-8"

Now based on the bitbake repository and not on the poky repo!

--000000000000033da505d1e8b23b
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Now based on the bitbake repository and not on the poky repo!<br></div>

--000000000000033da505d1e8b23b--

--000000000000033da605d1e8b23d
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-bitbake-doc-bitbake-user-manual-Add-more-explanation.patch"
Content-Disposition: attachment;
	filename="0001-bitbake-doc-bitbake-user-manual-Add-more-explanation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kwkdf8bv0>
X-Attachment-Id: f_kwkdf8bv0

RnJvbSBlNmY5ZWRiYTI4NWNkODlkNGZjYzljZjU1YzFmMDgxM2QxNjA5YWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiU2ltb24gQS4gRXVnc3RlciIgPHNpbW9uLmV1QGdtYWlsLmNv
bT4KRGF0ZTogTW9uLCAyOSBOb3YgMjAyMSAwODo0NjozMyArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IGJpdGJha2U6IGRvYzogYml0YmFrZS11c2VyLW1hbnVhbDogQWRkIG1vcmUgZXhwbGFuYXRpb25z
IHRvCiBPVkVSUklERVMKClNpZ25lZC1vZmYtYnk6IFNpbW9uIEEuIEV1Z3N0ZXIgPHNpbW9uLmV1
QGdtYWlsLmNvbT4KLS0tCiAuLi4vYml0YmFrZS11c2VyLW1hbnVhbC1tZXRhZGF0YS5yc3QgICAg
ICAgICAgfCAyOCArKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jL2JpdGJha2UtdXNlci1t
YW51YWwvYml0YmFrZS11c2VyLW1hbnVhbC1tZXRhZGF0YS5yc3QgYi9kb2MvYml0YmFrZS11c2Vy
LW1hbnVhbC9iaXRiYWtlLXVzZXItbWFudWFsLW1ldGFkYXRhLnJzdAppbmRleCBkODAyYThkMy4u
ZmM0ZjVkMTMgMTAwNjQ0Ci0tLSBhL2RvYy9iaXRiYWtlLXVzZXItbWFudWFsL2JpdGJha2UtdXNl
ci1tYW51YWwtbWV0YWRhdGEucnN0CisrKyBiL2RvYy9iaXRiYWtlLXVzZXItbWFudWFsL2JpdGJh
a2UtdXNlci1tYW51YWwtbWV0YWRhdGEucnN0CkBAIC0zMDAsNiArMzAwLDEyIEBAIEl0IGlzIGFs
c28gcG9zc2libGUgdG8gYXBwZW5kIGFuZCBwcmVwZW5kIHRvIHNoZWxsIGZ1bmN0aW9ucyBhbmQK
IEJpdEJha2Utc3R5bGUgUHl0aG9uIGZ1bmN0aW9ucy4gU2VlIHRoZSAiOnJlZjpgYml0YmFrZS11
c2VyLW1hbnVhbC9iaXRiYWtlLXVzZXItbWFudWFsLW1ldGFkYXRhOnNoZWxsIGZ1bmN0aW9uc2Ai
IGFuZCAiOnJlZjpgYml0YmFrZS11c2VyLW1hbnVhbC9iaXRiYWtlLXVzZXItbWFudWFsLW1ldGFk
YXRhOmJpdGJha2Utc3R5bGUgcHl0aG9uIGZ1bmN0aW9uc2AiCiBzZWN0aW9ucyBmb3IgZXhhbXBs
ZXMuCiAKKy4uIG5vdGU6OgorCisgICBCZWZvcmUgSG9uaXN0ZXIgKDMuNCksIG92ZXJyaWRlIHN0
eWxlIHVzZWQgYGBfYGAgaW5zdGVhZCBvZiBgYDpgYCwgc28geW91IHdpbGwKKyAgIHN0aWxsIGZp
bmQgYSBsb3Qgb2YgZG9jdW1lbnRhdGlvbiB1c2luZyDigJxfYXBwZW5k4oCdLCDigJxfcHJlcGVu
ZOKAnSwgYW5kCisgICDigJxfcmVtb3Zl4oCdLgorCiAuLiBfcmVtb3Zpbmctb3ZlcnJpZGUtc3R5
bGUtc3ludGF4OgogCiBSZW1vdmFsIChPdmVycmlkZSBTdHlsZSBTeW50YXgpCkBAIC01MTcsMjAg
KzUyMywyMiBAQCB2YXJpYWJsZS4KIC0gICpTZWxlY3RpbmcgYSBWYXJpYWJsZToqIFRoZSA6dGVy
bTpgT1ZFUlJJREVTYCB2YXJpYWJsZSBpcyBhCiAgICBjb2xvbi1jaGFyYWN0ZXItc2VwYXJhdGVk
IGxpc3QgdGhhdCBjb250YWlucyBpdGVtcyBmb3Igd2hpY2ggeW91IHdhbnQKICAgIHRvIHNhdGlz
ZnkgY29uZGl0aW9ucy4gVGh1cywgaWYgeW91IGhhdmUgYSB2YXJpYWJsZSB0aGF0IGlzCi0gICBj
b25kaXRpb25hbCBvbiAiYXJtIiwgYW5kICJhcm0iIGlzIGluIDp0ZXJtOmBPVkVSUklERVNgLCB0
aGVuIHRoZQorICAgY29uZGl0aW9uYWwgb24gImFybSIsIGFuZCAiYXJtIiBpcyBsaXN0ZWQgaW4g
OnRlcm06YE9WRVJSSURFU2AsIHRoZW4gdGhlCiAgICAiYXJtIi1zcGVjaWZpYyB2ZXJzaW9uIG9m
IHRoZSB2YXJpYWJsZSBpcyB1c2VkIHJhdGhlciB0aGFuIHRoZQogICAgbm9uLWNvbmRpdGlvbmFs
IHZlcnNpb24uIEhlcmUgaXMgYW4gZXhhbXBsZTo6CiAKLSAgICAgIE9WRVJSSURFUyA9ICJhcmNo
aXRlY3R1cmU6b3M6bWFjaGluZSIKKyAgICAgICMgVHlwaWNhbGx5LCBPVkVSUklERVMgY29udGFp
bnMgc29tZXRoaW5nIGxpa2UgYXJjaGl0ZWN0dXJlOm9zOm1hY2hpbmUKKyAgICAgIE9WRVJSSURF
UyA9ICJsaW51eDphcm0iCiAgICAgICBURVNUID0gImRlZmF1bHQiCi0gICAgICBURVNUX29zID0g
Im9zc3BlY2lmaWMiCi0gICAgICBURVNUX25vb3ZlcnJpZGUgPSAib3RoZXJjb25kdmFsdWUiCisg
ICAgICBURVNUOmFybSA9ICJhcm1zcGVjaWZpYyIKKyAgICAgIFRFU1Q6bm9vdmVycmlkZSA9ICJv
dGhlcmNvbmR2YWx1ZSIKIAotICAgSW4gdGhpcyBleGFtcGxlLCB0aGUgOnRlcm06YE9WRVJSSURF
U2AKLSAgIHZhcmlhYmxlIGxpc3RzIHRocmVlIG92ZXJyaWRlczogImFyY2hpdGVjdHVyZSIsICJv
cyIsIGFuZCAibWFjaGluZSIuCi0gICBUaGUgdmFyaWFibGUgYGBURVNUYGAgYnkgaXRzZWxmIGhh
cyBhIGRlZmF1bHQgdmFsdWUgb2YgImRlZmF1bHQiLiBZb3UKLSAgIHNlbGVjdCB0aGUgb3Mtc3Bl
Y2lmaWMgdmVyc2lvbiBvZiB0aGUgYGBURVNUYGAgdmFyaWFibGUgYnkgYXBwZW5kaW5nCi0gICB0
aGUgIm9zIiBvdmVycmlkZSB0byB0aGUgdmFyaWFibGUgKGkuZS4gYGBURVNUX29zYGApLgorICAg
SW4gdGhpcyBleGFtcGxlLCB0aGUgOnRlcm06YE9WRVJSSURFU2AgdmFyaWFibGUgbGlzdHMgdGhy
ZWUKKyAgIG92ZXJyaWRlczogImZvbyIsICJsaW51eCIsIGFuZCAiYXJtIi4gVGhlIHZhcmlhYmxl
IGBgVEVTVGBgIGJ5IGl0c2VsZgorICAgaGFzIGEgZGVmYXVsdCB2YWx1ZSBvZiAiZGVmYXVsdCIs
IGFuZCB0aGUgdmFsdWUgb2YgdGhlIOKAnGFybeKAnSBzcGVjaWZpYworICAgdmVyc2lvbiDigJxh
cm1zcGVjaWZpY+KAnSBpcyB1c2VkIGJlY2F1c2UgOnRlcm06YE9WRVJSSURFU2AgY29udGFpbnMK
KyAgIOKAnGFybeKAnS4gVGhlIOKAnG5vb3ZlcnJpZGXigJ0gc3BlY2lmaWMgdmVyc2lvbiBpcyBu
b3QgdXNlZCBiZWNhdXNlCisgICA6dGVybTpgT1ZFUlJJREVTYCBkb2VzIG5vdCBjb250YWluIOKA
nG5vb3ZlcnJpZGXigJ0uCiAKICAgIFRvIGJldHRlciB1bmRlcnN0YW5kIHRoaXMsIGNvbnNpZGVy
IGEgcHJhY3RpY2FsIGV4YW1wbGUgdGhhdCBhc3N1bWVzCiAgICBhbiBPcGVuRW1iZWRkZWQgbWV0
YWRhdGEtYmFzZWQgTGludXgga2VybmVsIHJlY2lwZSBmaWxlLiBUaGUKQEAgLTU1Miw3ICs1NjAs
NyBAQCB2YXJpYWJsZS4KIAogICAgICAgREVQRU5EUyA9ICJnbGliYyBuY3Vyc2VzIgogICAgICAg
T1ZFUlJJREVTID0gIm1hY2hpbmU6bG9jYWwiCi0gICAgICBERVBFTkRTOmFwcGVuZDptYWNoaW5l
ID0gImxpYm1hZCIKKyAgICAgIERFUEVORFM6YXBwZW5kOm1hY2hpbmUgPSAiIGxpYm1hZCIKIAog
ICAgSW4gdGhpcyBleGFtcGxlLCA6dGVybTpgREVQRU5EU2AgYmVjb21lcyAiZ2xpYmMgbmN1cnNl
cyBsaWJtYWQiLgogCi0tIAoyLjMwLjIKCg==
--000000000000033da605d1e8b23d--

