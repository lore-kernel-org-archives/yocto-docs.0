Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.11173.1606425406194728456
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 13:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=chksIeUi;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=2896; q=dns/txt; s=axis-central1;
  t=1606425406; x=1637961406;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ymzHXO9OYHzXB7DfXbYktTL+y4CNHNXn3OKtL2qfoHs=;
  b=chksIeUil966xE4eY2V1EsGLvEhx6Yun7VrK8f1aD5wXjCc5qaZ+Uirc
   krbkRsCAK8MZd6XfcBRKz0TwN6NEsy8SM6AyqF9Hm1aExWK1rcKAn29V1
   N0Mlt3uS0XuvGYbdanRVIu4l0ivkcvWZAEpskJ0RwKM1cGRVlqenIZZvL
   QdPHjuIkhP9awrgwe5KSuxyIBZBBPNDFBJa+SmduBz0wqaUNsjYs0rwQn
   EUt0qCjoLyXUgi+lLS5wIOsqCYcOUNjNDxTLwEfPzZlFfdqGyzgf/IlCn
   Yu6Kaknt1yniYmJnG4F2ysr22SrL/MvZlld3lW0axBIwZsTUv68Pvmggf
   A==;
IronPort-SDR: vjq58EGXfpYdF8ZXhzNdyuxF7u4s0mYPemAAVi5sBfH1M9+ghV/smlEaV3+lrgj69bVM6kCFZT
 2zuh58WWJIZtCGciUqgRN4e2xhktPeO7JFz6s8DGah7r0erEfQJYD+r6Mr16f2xzQrEU8oNtaf
 +8hxbwyMiG+413X1zQsFITthhPd4xL+mDgR65i2oNnyPH5wuMZZ9XbRCaG9WFhzuWHXfQ1hwvV
 feFD4cZdywXIpBksUJE/LH28pEIiogRa5BpebjEFWUKD4/1LR7p297lTtw3MFUJyICBv0Podpv
 oMg=
X-IronPort-AV: E=Sophos;i="5.78,373,1599516000"; 
   d="scan'208";a="15477258"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] clarifying the variations of BBMASK
Thread-Topic: [docs] clarifying the variations of BBMASK
Thread-Index: AQHWvQDZQmfIWuQlc0W5r8y+ezVNnqna9PkQ
Date: Thu, 26 Nov 2020 21:16:43 +0000
Message-ID: <a221d9c555a64b798d12b862a661e134@XBOX03.axis.com>
References: <8eb9ab43-974b-3fa2-4335-e13e2044bb61@crashcourse.ca>
In-Reply-To: <8eb9ab43-974b-3fa2-4335-e13e2044bb61@crashcourse.ca>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Robert P. J. Day
> Sent: den 17 november 2020 17:44
> To: YP docs mailing list <docs@lists.yoctoproject.org>
> Subject: [docs] clarifying the variations of BBMASK
>=20
>   as i've rarely needed to BBMASK stuff, i learned a couple things
> today when a colleague brought me some masking that could use some
> highlighting in the docs, methinks.
>=20
>   first, all of his BBMASKing was of the form:
>=20
>   BBMASK +=3D "|layer stuff ..."

Using +=3D with "|...." doesn't really make sense. Originally, BBMASK=20
only supported a single regular expression, and you would then=20
typically have to either use BBMASK .=3D "|..." or BBMASK_append =3D "|..."
This was troublesome as you had to basically know if something had=20
already added something to BBMASK to know whether you should use=20
BBMASK =3D "..." or BBMASK .=3D "|...". So I changed that a couple of=20
years ago so that it now supports multiple regular expressions. At=20
the same time I rewrote the documentation to only use examples that=20
use BBMASK +=3D "..." as there is absolutely no reason to promote the=20
old way of adding more regular expressions to BBMASK.

> that is, every value prefixed with "|". since the bitbake user manual
> does state that BBMASK supports Python REs, i guess it takes only a
> few seconds to realize that you *can* do that, or just leave spaces
> between patterns with:
>=20
>   BBMASK +=3D "layer stuff ..."
>=20
> a more obvious observation would be for the BB manual to actually show
> some examples that use "|" in a practical way, as none of the examples
> there do that.
>=20
>   what i did find surprising was that (apparently, and feel free to
> correct me) wildcarding was automatically applied to the end of a
> string. i noticed this as my colleague was trying to BBMASK a
> directory named "protobuf", and specified:
>=20
>   BBMASK +=3D "|.../protobuf"
>=20
> not realizing that it would also mask the sibling directory
> "protobuf-rpc". the BB manual does indirectly hint at that issue,
> writing, "When specifying a directory name, use the trailing slash
> character to ensure you match just that directory name," but a good
> example of that would be, i think, straight out of oe-core, showing
> that:
>=20
>   BBMASK +=3D ".../recipes-support/libcap"
>=20
> would unfortunately also BBMASK libcap-ng (hence the caution to use a
> trailing slash to lock it to the directory name).

This is standard behavior for regular expressions. If you want to match=20
the end of the path, you should use, e.g., BBMASK +=3D ".../foo_1.2.3.bb$"

>   so as long as i've understood all this, that explanation in the BB
> manual seems like it could use a couple more examples. or have i
> misread?
>=20
> rday

//Peter

