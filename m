Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.5171.1594960737458311275
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 21:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H02mthGF;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id u5so4794495pfn.7
        for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2020 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=zB+Q+l9xwuudQ2GbhPd08J4KovLy59OO90sphYJqS2o=;
        b=H02mthGFPp3cpjDNcEBlPa16nA5CHCf664RjuaT7HDvL7on/sDf7bHju59mkzAQzDr
         H4NDGS/AFcYfClbGSDUyi7B0ys7hBmvsnQHyGDL/DrFuTN3O6nwVVJpeqyVpjFVo+jGO
         4A9i4ZKfVRc9A7//AYg/gT/Z1VbhEYan7NpzxsPiebpMGTeMTd3LiwXXisFElLRNyLGf
         FsypYrFnxL0UpL3stszCOymaTtatDYQTuY6c0MGYYwEr/6KnMfYU/YqYISZEuNdYxUa4
         sPxQd2GrKCiJHzv8Knf/BOneyZL0+raOSCgcCi2k9CPhtDnT1onJHtD20EX6ztOXDCq5
         Iafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=zB+Q+l9xwuudQ2GbhPd08J4KovLy59OO90sphYJqS2o=;
        b=UWHWaTs/ddHP3cmBo0VyfgJn82ZNF06GGNRlCpNwneD9f0dG7zt6h/xE4I9RXtF/PH
         gXmFozaOulxgJtwVmFZyJy1AkyxGHgKevv7+XEoVvNgveYXVEpzf35/tfp5T7oWwaZoK
         kX8tDgCrYM1sCSDg7g5Up+SCwKbPeic8ErUrmsbKp8fhU5hz0sDumkFkcgbIcLJVYU+K
         SKNfFi4nSAjF5h6onsx496gVkECRtt7pIMdEgvZo7j2/GfDg2MmjXvCWKpYSVQXGdaVx
         hTgTj5CGWIZoyK6/cxw30qUl2qdEji9EB95PKBPUpTPKL9Z0+owAXagYCBqiT0RLO3mv
         +R2g==
X-Gm-Message-State: AOAM530cMb2Z5NdoDUr5t6hDNeFMgmaHSofVCdwN/9LbTrNCPkDluJEV
	KMKWl4Fr6DO4VIMTtoklbQ7IBPjuu0Y=
X-Google-Smtp-Source: ABdhPJyOJ2GcHuJ1gCv8lO2qEMeohuG+6Hy3TFaAW4jsb6duV/vWUH/9jAX6r2DUcfhz+hvZuZsPFA==
X-Received: by 2002:a62:3207:: with SMTP id y7mr6347103pfy.95.1594960736603;
        Thu, 16 Jul 2020 21:38:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::c44c? ([2601:646:9200:4e0::c44c])
        by smtp.gmail.com with ESMTPSA id i196sm6191082pgc.55.2020.07.16.21.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 21:38:55 -0700 (PDT)
Subject: Re: [docs] [PATCH] ref-system-requirements: update supported hosts lists
To: Steve Sakoman <steve@sakoman.com>, akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
References: <16225C0CF546C9E0.31624@lists.yoctoproject.org>
 <776527fe-3306-c772-103d-5632b4475809@gmail.com>
 <CAOSpxdbi1dZO3ZYBA_51mJrK=Pyw6PL588TSHwn9eVwhQs=gWw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 mQGiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdLQdS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT6IYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
 Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
 4evWolFf5cMmp7kEDQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiiEkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Message-ID: <76646a4d-9e9b-64ee-6bf7-c48217990f4c@gmail.com>
Date: Thu, 16 Jul 2020 21:38:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdbi1dZO3ZYBA_51mJrK=Pyw6PL588TSHwn9eVwhQs=gWw@mail.gmail.com>
X-Groupsio-MsgNum: 314
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="BhCPVWd8pfBBiqkaLGIwp20r2T246AEnw"

--BhCPVWd8pfBBiqkaLGIwp20r2T246AEnw
Content-Type: multipart/mixed; boundary="IM97wKFrqlnwzYgOJuTkCumA67JRihYXt";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Steve Sakoman <steve@sakoman.com>, akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Message-ID: <76646a4d-9e9b-64ee-6bf7-c48217990f4c@gmail.com>
Subject: Re: [docs] [PATCH] ref-system-requirements: update supported hosts
 lists
References: <16225C0CF546C9E0.31624@lists.yoctoproject.org>
 <776527fe-3306-c772-103d-5632b4475809@gmail.com>
 <CAOSpxdbi1dZO3ZYBA_51mJrK=Pyw6PL588TSHwn9eVwhQs=gWw@mail.gmail.com>
In-Reply-To: <CAOSpxdbi1dZO3ZYBA_51mJrK=Pyw6PL588TSHwn9eVwhQs=gWw@mail.gmail.com>

--IM97wKFrqlnwzYgOJuTkCumA67JRihYXt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/16/20 3:55 PM, Steve Sakoman wrote:
> On Thu, Jul 16, 2020 at 12:35 PM akuster808 <akuster808@gmail.com> wrote=
:
>>
>> Dunfell needs updating too but I am not sure if we can remove hosts tha=
t are no longer in the AB like Ubuntu 19.04 or the Fedora ones.
>=20
> I was just about to send a similar patch for dunfell.
>=20
> My assumption is that we don't remove previously supported distros
> from LTS.  Someone correct me if I'm mistaken!
>=20

I think eventually we have to address this to the host distros that will
be supported in the lifetime of LTS, perhaps we should call out for
tested distros separately

> Steve
>>
>> - armin
>>
>> On 7/16/20 3:27 PM, akuster via lists.yoctoproject.org wrote:
>>
>> drop Ubuntu 19, Fedora 28 & 29
>> Add: Fedora 31, 32 , Centos 8 and Ubuntu 20
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  documentation/ref-manual/ref-system-requirements.xml | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/documentation/ref-manual/ref-system-requirements.xml b/doc=
umentation/ref-manual/ref-system-requirements.xml
>> index 43e217c6d..ac8b0032d 100644
>> --- a/documentation/ref-manual/ref-system-requirements.xml
>> +++ b/documentation/ref-manual/ref-system-requirements.xml
>> @@ -94,11 +94,12 @@
>>              <itemizedlist>
>>                  <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
>>                  <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
>> -                <listitem><para>Ubuntu 19.04</para></listitem>
>> -                <listitem><para>Fedora 28</para></listitem>
>> -                <listitem><para>Fedora 29</para></listitem>
>> +                <listitem><para>Ubuntu 20.04</para></listitem>
>>                  <listitem><para>Fedora 30</para></listitem>
>> +                <listitem><para>Fedora 31</para></listitem>
>> +                <listitem><para>Fedora 32</para></listitem>
>>                  <listitem><para>CentOS 7.x</para></listitem>
>> +                <listitem><para>CentOS 8.x</para></listitem>
>>                  <listitem><para>Debian GNU/Linux 8.x (Jessie)</para></=
listitem>
>>                  <listitem><para>Debian GNU/Linux 9.x (Stretch)</para><=
/listitem>
>>                  <listitem><para>Debian GNU/Linux 10.x (Buster)</para><=
/listitem>
>>
>>
>>
>>
>>
>>
>>=20


--IM97wKFrqlnwzYgOJuTkCumA67JRihYXt--

--BhCPVWd8pfBBiqkaLGIwp20r2T246AEnw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXxErWgAKCRC7BTNVkZ0z
FEgQAJ9R+fFqcilatZPotnv1bfqRrnmq3wCgi1l22MKJaYNUvkrWrsKn64ig58s=
=XKNz
-----END PGP SIGNATURE-----

--BhCPVWd8pfBBiqkaLGIwp20r2T246AEnw--
