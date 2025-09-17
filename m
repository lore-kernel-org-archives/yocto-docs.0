Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1D5CAC59D
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.23898.1758117828767440064
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BELYtVoX;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3947CC653F4
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:03:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4B086063E;
	Wed, 17 Sep 2025 14:03:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC3EE102F1A16;
	Wed, 17 Sep 2025 16:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758117826; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R8ZOdaGaEsh2YAMTddS/VQu7nOwq6HS48OQlTFx+6VI=;
	b=BELYtVoXqO2bvgze53FQ+0VRwQihQ9zMWq9zFC5mppzT+ytUQO4SykXY4xSfgo2+DIDaFd
	jf6ouJkE4mVohlxlWZU9ToB7tTdfu8C39uRE+qyb2DxqYP/tRAW1AsTeMyRZ8SxzToe8td
	c9L516il7elxjbgqSi0LM6jOilWrSCv6dw/41WABwQKaFvTLYQ4m/BGKxOhpCJ6QzeMnsk
	qFk3VqECga91s3dLOPokgXAE5Dv3mZitTGSkB6SlwYfGlmm1/j/jGz1xPvBi6UJN33sXyV
	rkVScusJr+lZYatq7K7tDzABFBVOUP9Km1pCgAXZAwEN6CnHe6kFjSGVIOBaPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Sep 2025 16:03:44 +0200
Message-Id: <DCV4R6GV3UVN.IJQ57DG44IXK@bootlin.com>
To: <barne.carstensen@danfoss.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] test-manual: update runtime-testing Exporting
 Tests section
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250916110116.1227-1-barne.carstensen@danfoss.com>
In-Reply-To: <20250916110116.1227-1-barne.carstensen@danfoss.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7525

Hi,

On Tue Sep 16, 2025 at 1:01 PM CEST, Barne Carstensen via lists.yoctoprojec=
t.org wrote:
> Signed-off-by: Barne Carstensen <barne.carstensen@danfoss.com>
> ---
>  documentation/test-manual/runtime-testing.rst | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/test-manual/runtime-testing.rst b/documentatio=
n/test-manual/runtime-testing.rst
> index 557e0530b..909448ab2 100644
> --- a/documentation/test-manual/runtime-testing.rst
> +++ b/documentation/test-manual/runtime-testing.rst
> @@ -403,7 +403,7 @@ defined in :term:`TEST_SUITES`.
>  If your image is already built, make sure the following are set in your
>  ``local.conf`` file::
> =20
> -   INHERIT +=3D "testexport"
> +   IMAGE_CLASSES +=3D "testexport"
>     TEST_TARGET_IP =3D "IP-address-for-the-test-target"
>     TEST_SERVER_IP =3D "IP-address-for-the-test-server"
> =20
> @@ -413,18 +413,23 @@ following BitBake command form::
>     $ bitbake image -c testexport
> =20
>  Exporting the tests places them in the :term:`Build Directory` in
> -``tmp/testexport/``\ image, which is controlled by the :term:`TEST_EXPOR=
T_DIR`
> +``tmp/testimage/``\ image, which is controlled by the :term:`TEST_EXPORT=
_DIR`
>  variable.
> =20
>  You can now run the tests outside of the build environment::
> =20
> -   $ cd tmp/testexport/image
> -   $ ./runexported.py testdata.json
> +   $ cd tmp/testimage/image
> +   $ ./oe-test runtime
> +
> +.. note::
> +
> +   You might need to run the image under QEMU or deploy it to your
> +   hardware before you can run the tests.
> =20
>  Here is a complete example that shows IP addresses and uses the
>  ``core-image-sato`` image::
> =20
> -   INHERIT +=3D "testexport"
> +   IMAGE_CLASSES +=3D "testexport"
>     TEST_TARGET_IP =3D "192.168.7.2"
>     TEST_SERVER_IP =3D "192.168.7.1"
> =20
> @@ -435,8 +440,8 @@ Use BitBake to export the tests::
>  Run the tests outside of
>  the build environment using the following::
> =20
> -   $ cd tmp/testexport/core-image-sato
> -   $ ./runexported.py testdata.json
> +   $ cd tmp/testimage/core-image-sato
> +   $ ./oe-test runtime
> =20
>  Writing New Tests
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I've tested these changes and it looks like this applies since ed4238487c81
("testexport: Fix to work as an image class"). So can be backported to waln=
ascar
and scarthgap.

I will include this in the commit message, as I think the patch itself is
correct. Next time, can you please include a commit message body describing=
 the
change and ideally referencing the commit that implied this change?

I've tested this on a core-image-minimal/qemuarm64 build and was able
to run some tests with your modifications. So:

Tested-by: Antonin Godard <antonin.godard@bootlin.com>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

I just had issues, I wonder if you also encountered them:

    File ".../tmp/testimage/core-image-minimal/meta/lib/oeqa/runtime/cases/=
storage.py", line 129, in setUpClass
      self.test_dir =3D os.path.join(self.mount_point, "oeqa")
                      ^^
  NameError: name 'os' is not defined

I have the feeling that this works when using `bitbake -c testimage <image>=
`
directly, because in bitbake the os module is available by default, and OE-=
Core
test were written with this in mind?

But in an exported environment, you obviously don't have this module import=
ed by
default, like any other Python program (even after having sourced the
environment). In that case this would maybe mean that:

- we should import os in these files.
- or we consider that these tests were made for OECore testing with testima=
ge
  only.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


