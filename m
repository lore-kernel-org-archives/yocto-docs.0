Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.4799.1603923522937361062
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 15:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kAWgo2cC;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1798; q=dns/txt; s=axis-central1;
  t=1603923523; x=1635459523;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nkd5IqAQGDy4DNPqmm+x1DJL7yPiNVxJqa4aNBsYWgk=;
  b=kAWgo2cCIbydRNEIuG+/Skpy9hF6JWjOYGfmH9V8PiUxRZWruFMbgsnW
   ePqvJNTSF+L9GmqXTsz3bEKq0gjyLTRa89aCKotJurH6yTZ0j+ytJfKdt
   kly+esZdJuItdQLzTUPMddrASMt38ot6jCvBAvpDV0VCKPyBLq4/NZGZp
   tJR6EijBiASPQePUVtVR+imtTvT1lQlIKlaSEV4vamK/h8vtlKyHnjyvT
   5/LP3uk/+c9PUOuhaJ5f95NbWg5bx4Jphc4AVE+BpkAZe47BXoS2qJvwR
   Yctpm8wz1sW7yONF8jdZNTi9G7j7ogVszF/stZsoMc5PP1FEAsW5C1XeJ
   w==;
IronPort-SDR: C8KBijb6PZFv/jNBpBG4bGbfw74lw5y5Jjo+x94QwM634y845q7G/fKjGyFbRP3+k7AtPtuksh
 pCzdevvVBJe4YYA3MpplrBgBnZ49TZUtGyf5mYoxUFse1+xVY2SpxzY4+1ILjUggpoMHOtgBRt
 24qhaF4ATyn0rtK/6eMvAnGPIKa91ONv5veN7+EVNqIhR1XsnFJZTrWQug3UeiY/fvsXSgM7IQ
 j7IriXOOhasG899jsSAVThpM5Vtkr8Sd0C1jzi8fnOao2B7sFYtHtVtT98wt0CK1S8IEF85EDc
 VkU=
X-IronPort-AV: E=Sophos;i="5.77,428,1596492000"; 
   d="scan'208";a="14531236"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 4/7] ref-manual: add PSEUDO_IGNORE_PATHS
Thread-Topic: [docs] [PATCH 4/7] ref-manual: add PSEUDO_IGNORE_PATHS
Thread-Index: AQHWrMhHeI2+pRlYpUCjgyi5PwTZEamtlPkw
Date: Wed, 28 Oct 2020 22:18:36 +0000
Message-ID: <ca8c02ed3f724e49bb6dfb5481f5ebb0@XBOX03.axis.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
 <c9245b18556164df9e94c07084918116182cbfb3.1603839557.git.paul.eggleton@linux.microsoft.com>
In-Reply-To: <c9245b18556164df9e94c07084918116182cbfb3.1603839557.git.paul.eggleton@linux.microsoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Paul Eggleton
> Sent: den 28 oktober 2020 02:19
> To: docs@lists.yoctoproject.org
> Subject: [docs] [PATCH 4/7] ref-manual: add PSEUDO_IGNORE_PATHS
>=20
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> Add a brief variable glossary entry for the new PSEUDO_IGNORE_PATHS
> variable.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/ref-variables.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/documentation/ref-manual/ref-variables.rst
> b/documentation/ref-manual/ref-variables.rst
> index a7315cf..176c94a 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -5932,6 +5932,14 @@ system and gives an overview of their function and=
 contents.
>        service <dev-manual/dev-manual-common-tasks:working with a pr serv=
ice>`. You can
>        set ``PRSERV_HOST`` to other values to use a remote PR service.
>=20
> +
> +   :term:`PSEUDO_IGNORE_PATHS`
> +      A comma-separated (without spaces) list of files that should be ig=
nored

Based on the default definition of PSEUDO_IGNORE_PATHS in bitbake.conf, say=
ing=20
"files" here seems misleading. It seems to support files, directories and e=
ven=20
prefixes, e.g., "${WORKDIR}/deploy-".

> +      by pseudo when monitoring and recording file operations, in order =
to avoid
> +      problems with files being written to outside of the pseudo context=
 and
> +      reduce pseudo's overhead.
> +
> +
>     :term:`PTEST_ENABLED`
>        Specifies whether or not :ref:`Package
>        Test <dev-manual/dev-manual-common-tasks:testing packages with pte=
st>` (ptest)
> --
> 1.8.3.1

//Peter

