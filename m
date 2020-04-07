Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.339.1586219045853612486
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 17:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=D+1GN8Td;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2665; q=dns/txt; s=axis-central1;
  t=1586219046; x=1617755046;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=R9Acmz3upAYGcUV8ZLvAZgq97IJbLbaChopFpKgtJoM=;
  b=D+1GN8TdtVNE6kvcXrrud3ARnTEwqPLiPMuLZkcp0tqmXIpjEepWI+yo
   lqR+88ia7PGjNrmGnBzghjKzrYdKFcjG9ryOC9AznkVGJvVFhweI5uXOF
   x6iymgCg+Npc3+PRm0uo5ssXsuyuxZ8e5y6YqhyAtuRBY7W1WemBuRtP1
   J2pPreQ5aNU1ruslnjEMorezLN/f/TmF6FCNMAZLQ2pe+SGM1O/uzX7qh
   MxHx8muCjgy+IBvF5mgcZ2pKADg4bebovhUuw3GRrpXTqJeJ/m5VOM+qB
   Zkihha1m3Dv72pBbv9jccCGpF7u521P58mcZEg92MHgfk4vRy2y/cop+/
   g==;
IronPort-SDR: hW529DE7VjL2RzU9O0PEVpJvVH+jN77PecXSK3uiLtb+P7mNvV0PbKQ0mRmbDdFhthK5Z0RdKn
 NGWxcn4BUH7MKWLiaLYvmP7BjrlwPQvGBPFhmdYRo3zPoER2xQMI8SWVOKHqWx+yKVdnwrOHOS
 QxewwFCbF4FqlHWFz+KSfp+ES1YLWeV0FAm7NDeqyT8Je/GgTpiPl1HOi5Ph5rxVOyXdf+XMEC
 p4tJbMbmgCu13Mzt4B6A8pVsDVONgbDUGcloGAMTvO6XDsHGom8wtXYmS05MbYbQVIPqEEW6+y
 dJ8=
X-IronPort-AV: E=Sophos;i="5.72,352,1580770800"; 
   d="scan'208";a="7392046"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: reverse "=" and "+=" for IMAGE_FEATURES
Thread-Topic: [docs] [PATCH] dev-manual: reverse "=" and "+=" for
 IMAGE_FEATURES
Thread-Index: AQHWDFKTslJ9L6LJUki3PZG9TZdkRahsy0kQ
Date: Tue, 7 Apr 2020 00:24:03 +0000
Message-ID: <947bafddeda147cab3b2c55921fb9eeb@XBOX03.axis.com>
References: <alpine.LFD.2.21.2004061631560.10956@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004061631560.10956@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You probably want +=3D in both cases. Also, adding to IMAGE_FEATURES is=20
more appropriately done in an image recipe, while adding to=20
EXTRA_IMAGE_FEATURES is typically done in the local.conf, so:

            <para>
                To create the read-only root filesystem, simply add the
                "read-only-rootfs" feature to your image.
                Either add the following statement to your image recipe:
                <literallayout class=3D'monospaced'>
     IMAGE_FEATURES +=3D "read-only-rootfs"
                </literallayout>
                or add the following statement to the
                <filename>local.conf</filename> file found in the
                <ulink url=3D'&YOCTO_DOCS_REF_URL;#build-directory'>Build D=
irectory</ulink>:
                <literallayout class=3D'monospaced'>
     EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs"
                </literallayout>
            </para>

//Peter

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of rpjday@crashcourse.ca
> Sent: den 6 april 2020 22:33
> To: YP docs mailing list <docs@lists.yoctoproject.org>
> Subject: [docs] [PATCH] dev-manual: reverse "=3D" and "+=3D" for
> IMAGE_FEATURES
>=20
> Pretty sure these assignments are in the reverse order.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml
> b/documentation/dev-manual/dev-manual-common-tasks.xml
> index 2b8868b62..b9d527486 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.xml
> +++ b/documentation/dev-manual/dev-manual-common-tasks.xml
> @@ -11202,11 +11202,11 @@
>                  <ulink url=3D'&YOCTO_DOCS_REF_URL;#build-directory'>Buil=
d
> Directory</ulink>
>                  causes the build system to create a read-only root
> filesystem:
>                  <literallayout class=3D'monospaced'>
> -     IMAGE_FEATURES =3D "read-only-rootfs"
> +     IMAGE_FEATURES +=3D "read-only-rootfs"
>                  </literallayout>
>                  or
>                  <literallayout class=3D'monospaced'>
> -     EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs"
> +     EXTRA_IMAGE_FEATURES =3D "read-only-rootfs"
>                  </literallayout>
>              </para>
>=20
>=20
> --
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
