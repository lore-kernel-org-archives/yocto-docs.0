Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FC2CEE32F
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 16:18:22 +0000 (UTC)
Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
 by mx.groups.io with SMTP id smtpd.web11.21085.1728490697724242073
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 09:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=PV8lWIlE;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.48, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D172EC78C7
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 16:18:16 +0000 (UTC)
Received: from uk-fast-smtpout3.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.101.175.87])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1D3F4C70EB
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 16:18:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728490696; a=rsa-sha256;
	cv=none;
	b=Ortd+PuaLY1dY3UFP6cg8jbVk5qzhxjfrFcGJUTOx1leOnQKdMhOJZIJRWW0pfAts0D3dD
	R+3IHJmQzM8y/LqaghDmbeSmJzCmHXZfEPbwiDdfjHDoI8Gg9rlFROkFJZgXIIcJcgpQdR
	oPlqdM+P3OhK89SYcNJKD/MkVzzNqTWXILBIHdScwp1EuZk+26fjm/JkOYYjKM6YO7nz7L
	+FifG4WFXWvFmWBKJrVsKuS27LTGjuc8IxLpYtbG7aaWZGpsXKiOm6Xx//pu8iusWEX8v1
	4PKUQvYyByoV/AoWS+xeC+LUsokLq+bEAOtkLFOIJ1vWwzvYH8WRHIIabtD98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728490696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Ki1KsaPog483kpWFr6Qcu+ZD7sKEsLh2XY0PsFOO5tA=;
	b=4KNp7AQJ+z8bH0AEJCKpC9RM1yxz2lLXaLXEnhSBkHgV8asn8rbEv+riaY1ps8txpnkysa
	yTOyEvQqI/M42q13ZbI/tcczteSMmsr+2j6NfVFZdaWUHal3Rw3+pJ+99SsGH7SjA/8nuR
	E9ZJej310yTb3+Ob6TNtMnn8vryJvWg+MY8MeciAs2VzJWhzIt1A0KQbInIgpNPP4ZtQ4G
	e/5fnex12f4K0jybltGVOHSu0BI59NrElMRpVNrDFXcbLM5XVgAN41qjPURGCEtORMXDGs
	E/kxIoWeVE036Zu69YJuEvLOrCLyscFjEv8VL6Ytiqq9lsn7kt/fQTW+J8HuIw==
ARC-Authentication-Results: i=1;
	rspamd-54f99b5bc4-lgjjm;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Wipe-Illustrious: 13325d2230cd4996_1728490696750_2805805971
X-MC-Loop-Signature: 1728490696749:1949800514
X-MC-Ingress-Time: 1728490696749
Received: from uk-fast-smtpout3.hostinger.io (uk-fast-smtpout3.hostinger.io
 [31.220.23.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.175.87 (trex/7.0.2);
	Wed, 09 Oct 2024 16:18:16 +0000
Content-Type: multipart/alternative;
 boundary="------------PGyg6eY7I29riapmHnlyyNqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728490694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ki1KsaPog483kpWFr6Qcu+ZD7sKEsLh2XY0PsFOO5tA=;
	b=PV8lWIlE3tiOAWkeqnLhSCAft5YV/EKSNhwnPFy6/oBvpug51cqlF3EOqIHOPz6Gq2LbOC
	auygCxehZ+Y3XU8RnO/j95gsIJY6X+d1WBJtrKJay9UvSlc6IUeHn0UzGgnf58+4mz+62R
	KG67e29oORC3bhDCxNMbdB79Vij+IsOkEc9XLBG9y1uranhW7l5IsnX0fZXHfmcBrEbuGH
	lCoe4P/164m54NYYscl+kGkpdM2UYQNTO7AtfwZFUV+OqJYbziAtBwjTguzBFySPl+k3mz
	fRN58fe6cUJ7ou6inpu78XBTCHtOXGK+oMgS2UDsJR+36FIUVjfkdOe5WTvLBA==
Message-ID: <e6f6bc70-2dea-4e51-9288-ff11ee8e89e7@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com, Lee Chee Yang <chee.yang.lee@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [docs] [PATCH 15/16] release-notes-5.1: update for several
 section
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-16-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-16-antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 16:18:13 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=TcnEtgQh c=1 sm=1 tr=0 ts=6706acc6 a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=r77TgQKjGQsHNAKrUKIA:9 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=1yPpRFYEPntwhs7Nz6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=P-IC7800AAAA:8 a=9ea433JKRiyZL6QJzNAA:9 a=wE8GiUAwYwirDtLz:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22 a=d3PnA9EDa4IxuAV0gXij:22
X-CM-Envelope: MS4xfM+kHmP/yl5jBtRqdqZ+qylJvklnkC7Pe0kwOrXbZnF4Pe1ITK0w4ix55AOzuq968l5uH5sGgvnLxfIpXyMzqk6EcPbPQST7Ep5a3GCH1F66m0b1wXRi sn4laNTxAOvaVsEQpPs4w5e6Lls+HBCDkcIHKlRrXJSvhC1IAufeuuvJOxhD+jRZNMcUuCy+Uosp3WYJXjJpH89GrEZhrVXHSg/mw96BQi9sndyl4Pje3DrY KqvaiP2Q9s6L37L8CrBE8kR78u8xIBH3uLmIMUUdM11zM8tKrSuZNEJAJHNZ9URmV7+JlimDbI1WZKHrkSXPMrayy9xT0fEVnHWRW0vy/Wf9/yxf4XVPqpti v8RwavnWN652LcvjLTaIjj9UwZsRWA1wPHTM15h/oS+JDTH/sKlXd9jjFd/4lOK9H2qsapRSlYqXNLHiAmMN5Kv8QrnKdH1U1KV4uV7g4NgXzxZ0i5Sbi2kt SZk4Ei12ZKyS8zV3RvQLi2njNXEvQ0H4BHt7uW0yRzQ/CvIOYY7p9pcRXQy+EIlKcuLVVFIN6Z9LjOVG2Xi989wNf2V9Ei2ICKNecw==
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 16:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5450

This is a multi-part message in MIME format.
--------------PGyg6eY7I29riapmHnlyyNqi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 10/9/24 09:41, Antonin Godard via lists.yoctoproject.org wrote:
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/doc=
umentation/migration-guides/release-notes-5.1.rst
> index 074d277da..211f92553 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
>
> +   - runqemu: :term:`QB_DRIVE_TYPE` now support for sd card (/dev/mmcb=
lk)
You didn't write it in the first place, but that's an opportunity to use=20
``/dev/mmcblk`` here.
>  =20
> --  wic Image Creator enhancements:
> +-  Rust improvements:
>  =20
>   -  SDK-related improvements:
>  =20
> +   -  included ``nativesdk-python3-pip`` in buildtools.
> +
>   -  Testing:
>  =20
>      -  oeqa/selftest: Only rewrite envvars paths that absolutely point=
 to builddir
>  =20
> -   -  Enable ptests for ``python3-libarchive-c``
> +   -  Enable ptests for ``python3-cffi``, ``python3-idna``, ``python3-=
libarchive-c``,
> +      ``python3-mako``, ``python3-packaging``, ``python3-uritools`` an=
d ``python3-rpds-py``.
>  =20
>   -  Utility script changes:
>  =20
> +   -  New ``cve-json-to-text`` script that converts the cve-check resu=
lt from the JSON format
> +      to the TEXT format as cve-check removed text format.


s/cve-check/``cve-check``/
as in other places in the docs.

> +
> +   -  New ``makefile-getvar`` script to extract value from a Makefile.
> +
> +   -  New ``pull-spdx-licenses`` script to pull SPDX license data, upd=
ate license list JSON
> +      data and update license directory.
> +
> +   -  Several improvements in ``oe-build-perf-report`` report.
> +
> +   -  ``oe-debuginfod`` add parameter "-d" to store debuginfod files i=
n project sub-directory.

Add ":" after ``oe-debuginfod``?

> +
> +   -  ``resulttool`` support test report generation in JUnit XML forma=
t.


Same here after ``resulttool``.

> +
> +
>   -  BitBake improvements:
>  =20
> +   -  New go module fetcher (``gomod://``) for downloading module depe=
ndencies to the
> +      module cache from a module proxy.
> +
> +   -  New go module fetcher (``gomodgit://``) for downloading module d=
ependencies to the
> +      module cache directly from a git repository.

s/go/Go/=C2=A0 in the above lines.

> +
> +   -  Fetcher for rust crate: added check for latest upstream version.

s/rust/Rust/

See the style guide for project names:=20
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n=
79
I know that the style is not very strictly enforced in release notes.=20
This is not exactly like formal documentation.

It's up to you. It's not a big deal if you don't change these. The same=20
applies to the following lines...

> +
> +   -  Syncrpc now requires a minimum version of the websockets module =
depend on python version.


s/python/Python/?

> +
> +   -  Improved bitbake-hashclient stress statistics reporting.
> +
> +   -  bitbake-hashserv added ``reuseport`` parameter to enable SO_REUS=
EPORT, allowing
> +      multiple servers to bind to the same port for load balancing
> +
> +   -  improved cloning speed with :term:`BB_GIT_SHALLOW` and :term:`BB=
_GENERATE_MIRROR_TARBALLS`.
> +
> +   -  bitbake UI now include log paths for failed task.


s/bitbake/BitBake/?

> +
> +   -  fetcher2 support for wget and wget2.
> +
> +   -  fetcher2 support npm package name with '@' character.
> +
> +   -  Codeparser now support shell substitution in quotes, for example=
::
> +
> +         var1=3D"$(cmd1 ...)"
> +
>   -  devtool improvements:
>  =20
>      - Fix ``_test_devtool_add_git_url`` test
> @@ -52,6 +114,54 @@ New Features / Enhancements in 5.1
>  =20
>      -  Fix reproducibility for ``spirv-tools``
>  =20
> +   -  Allow selection of host key types used by openssh.
> +
> +   -  New glibc task do_symlist to list exported symbols.
> +
> +   -  initramfs-framework support for force reboot in the case of fata=
l error.
> +
> +   -  insane class now check for patch-status and pep517-backend by de=
fault.

:ref:`ref-classes-insane`

> +
> +   -  New ``yocto-space-optimize`` include file to allow turning off d=
ebug compiler options
> +      for a small set of recipes to reduce build on disk footprint and=
 package/sstate sizes.
> +
> +   -  Update to SPDX license version 3.24.0
> +
> +   -  New :ref:`create-spdx-3.0` class to generate SPDX 3.0 output, :r=
ef:`create-spdx-image-3.0`
> +      class that is used when generating images and :ref:`create-spdx-=
sdk-3.0` for sdk
> +      based recipes.
s/sdk/SDK/
> +
> +   -  New :ref:`nospdx` class that allows recipes to opt out of genera=
ting SPDX.

Are you sure this works? Looking at your earlier patch, shouldn't it be=20
:ref:`ref-classes-nospdx` instead?

> +
> +   -  New :ref:`Vex` class generates the minimum information that is n=
ecessary
> +      for VEX generation by an external CVE checking tool.
> +
> +   -  New :ref:`retain` class creates a tarball of the work directory =
for a recipe
> +      when one of its tasks fails, or any other nominated directories.
> +
> +   -  New :ref:`localpkgfeed` class in meta-selftest to create a subse=
t of the
> +      package feed that just contain the packages depended on by this =
recipe.


Same comment for the above three items.

That's all here ;)
Thanks
Michael.

--=20
Michael Opdenacker
Root Commit
https://rootcommit.com

--------------PGyg6eY7I29riapmHnlyyNqi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10/9/24 09:41, Antonin Godard via
      lists.yoctoproject.org wrote:<span style=3D"white-space: pre-wrap">
</span></div>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/docum=
entation/migration-guides/release-notes-5.1.rst
index 074d277da..211f92553 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst

+   - runqemu: :term:`QB_DRIVE_TYPE` now support for sd card (/dev/mmcblk=
)</pre>
    </blockquote>
    You didn't write it in the first place, but that's an opportunity to
    use ``/dev/mmcblk`` here.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
=20
--  wic Image Creator enhancements:
+-  Rust improvements:
=20
 -  SDK-related improvements:
=20
+   -  included ``nativesdk-python3-pip`` in buildtools.
+
 -  Testing:
=20
    -  oeqa/selftest: Only rewrite envvars paths that absolutely point to=
 builddir
=20
-   -  Enable ptests for ``python3-libarchive-c``
+   -  Enable ptests for ``python3-cffi``, ``python3-idna``, ``python3-li=
barchive-c``,
+      ``python3-mako``, ``python3-packaging``, ``python3-uritools`` and =
``python3-rpds-py``.
=20
 -  Utility script changes:
=20
+   -  New ``cve-json-to-text`` script that converts the cve-check result=
 from the JSON format
+      to the TEXT format as cve-check removed text format.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>s/cve-check/``cve-check``/ <br>
      as in other places in the docs.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  New ``makefile-getvar`` script to extract value from a Makefile.
+
+   -  New ``pull-spdx-licenses`` script to pull SPDX license data, updat=
e license list JSON
+      data and update license directory.
+
+   -  Several improvements in ``oe-build-perf-report`` report.
+
+   -  ``oe-debuginfod`` add parameter "-d" to store debuginfod files in =
project sub-directory.</pre>
    </blockquote>
    <p>Add ":" after ``oe-debuginfod``?<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  ``resulttool`` support test report generation in JUnit XML format.=
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Same here after ``resulttool``.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+
 -  BitBake improvements:
=20
+   -  New go module fetcher (``<a class=3D"moz-txt-link-freetext" href=3D=
"gomod://">gomod://</a>``) for downloading module dependencies to the
+      module cache from a module proxy.
+
+   -  New go module fetcher (``<a class=3D"moz-txt-link-freetext" href=3D=
"gomodgit://">gomodgit://</a>``) for downloading module dependencies to t=
he
+      module cache directly from a git repository.</pre>
    </blockquote>
    <p>s/go/Go/=C2=A0 in the above lines.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  Fetcher for rust crate: added check for latest upstream version.</=
pre>
    </blockquote>
    <p>s/rust/Rust/<br>
      <br>
      See the style guide for project names:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/y=
octo-docs/tree/documentation/standards.md#n79">https://git.yoctoproject.o=
rg/yocto-docs/tree/documentation/standards.md#n79</a><br>
      I know that the style is not very strictly enforced in release
      notes. This is not exactly like formal documentation.<br>
      <br>
      It's up to you. It's not a big deal if you don't change these. The
      same applies to the following lines...<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  Syncrpc now requires a minimum version of the websockets module de=
pend on python version.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>s/python/Python/?<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  Improved bitbake-hashclient stress statistics reporting.
+
+   -  bitbake-hashserv added ``reuseport`` parameter to enable SO_REUSEP=
ORT, allowing
+      multiple servers to bind to the same port for load balancing
+
+   -  improved cloning speed with :term:`BB_GIT_SHALLOW` and :term:`BB_G=
ENERATE_MIRROR_TARBALLS`.
+
+   -  bitbake UI now include log paths for failed task.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>s/bitbake/BitBake/?<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  fetcher2 support for wget and wget2.
+
+   -  fetcher2 support npm package name with '@' character.
+
+   -  Codeparser now support shell substitution in quotes, for example::
+
+         var1=3D"$(cmd1 ...)"
+
 -  devtool improvements:
=20
    - Fix ``_test_devtool_add_git_url`` test
@@ -52,6 +114,54 @@ New Features / Enhancements in 5.1
=20
    -  Fix reproducibility for ``spirv-tools``
=20
+   -  Allow selection of host key types used by openssh.
+
+   -  New glibc task do_symlist to list exported symbols.
+
+   -  initramfs-framework support for force reboot in the case of fatal =
error.
+
+   -  insane class now check for patch-status and pep517-backend by defa=
ult.</pre>
    </blockquote>
    <p>:ref:`ref-classes-insane`<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  New ``yocto-space-optimize`` include file to allow turning off deb=
ug compiler options
+      for a small set of recipes to reduce build on disk footprint and p=
ackage/sstate sizes.
+
+   -  Update to SPDX license version 3.24.0
+
+   -  New :ref:`create-spdx-3.0` class to generate SPDX 3.0 output, :ref=
:`create-spdx-image-3.0`
+      class that is used when generating images and :ref:`create-spdx-sd=
k-3.0` for sdk
+      based recipes.</pre>
    </blockquote>
    s/sdk/SDK/<br>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  New :ref:`nospdx` class that allows recipes to opt out of generati=
ng SPDX.</pre>
    </blockquote>
    <p>Are you sure this works? Looking at your earlier patch, shouldn't
      it be :ref:`ref-classes-nospdx` instead?<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20241009074120.866786-16-antonin.godard@bootlin.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+   -  New :ref:`Vex` class generates the minimum information that is nec=
essary
+      for VEX generation by an external CVE checking tool.
+
+   -  New :ref:`retain` class creates a tarball of the work directory fo=
r a recipe
+      when one of its tasks fails, or any other nominated directories.
+
+   -  New :ref:`localpkgfeed` class in meta-selftest to create a subset =
of the
+      package feed that just contain the packages depended on by this re=
cipe.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Same comment for the above three items. <br>
    </p>
    <p>That's all here ;)<br>
      Thanks<br>
      Michael.</p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Michael Opdenacker
Root Commit
<a class=3D"moz-txt-link-freetext" href=3D"https://rootcommit.com">https:=
//rootcommit.com</a></pre>
  </body>
</html>

--------------PGyg6eY7I29riapmHnlyyNqi--

