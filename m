Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3F6C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:47:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.6982.1742287631399585398
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 01:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CMcZXaho;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6370541CF9;
	Tue, 18 Mar 2025 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742287629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/+KslZrb83dcOGTNpS64OZBXRgcaoXLE1AEwQpI9Og=;
	b=CMcZXahoZq6Ql3cauB92Y6rISWv1QlNnaqt6eEFNcMaCEsvVZIQLeUDTNhFzudXArwO36y
	ZL4rRmanlontT6ETFsmbQCm0Klp/ktXXwx6WpRqEgxdbl46viCzLcGVuMsVIWEPWD4Cqik
	eQg25L0iEk3LhFTwdjFUJcyPt9qatr0BCj0e6FHMOtcEu65pmstC674cedRNJLERGVnXyd
	OIpJcb83PmsUNch4TpxOg5pVDjbKxAREnIxs3eclj+pcoNJF6l2G/6zOKQzU5IW7ZFvHO0
	67zdabQMWCyVwLzK+U9h0DT4nVIb3CpdJyVNJe/yK9ZWIPW2zsdEsZc8CLBonA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 09:47:09 +0100
Message-Id: <D8J9F39E75YT.3LPYH2XMZM9T1@bootlin.com>
Subject: Re: [PATCH 11/11] migration-guides/release-notes-5.2: update for
 upcoming 5.2 release
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-30-g1e234577c2bf-dirty
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com> <20250317-release-note-5-2-updates-v1-11-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-11-82b0a4182aff@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeduleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejfefgvdfhtdffiedvkeegleelvddtieetgfefffetueduheeltdeuudfhudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihtvghsthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrh
 ihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 08:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6591

Hi Antonin,

On Mon Mar 17, 2025 at 10:06 AM CET, Antonin Godard wrote:
[...]
>     -  Import ``makedumpfile`` from meta-openembedded, as the ``kexec-too=
ls``
>        recipe :term:`RDEPENDS` on it.
> @@ -69,6 +123,30 @@ New Features / Enhancements in |yocto-ver|
>        </meta-openembedded>`, a recipe for hardware identification and
>        configuration data, needed by ``libdisplay-info``.
> =20
> +   -  The ``cve-update-db-native`` was restored from kirkstone and can b=
e used
> +      to update the CVE National Vulnerability Database (NVD). Add suppo=
rt for
> +      the FKIE-CAD (https://github.com/fkie-cad/nvd-json-data-feeds) CVE=
 source
> +      for it.
> +
> +   -  The ``rpm-sequoia-crypto-policy`` to ship a crypto policy file for=
 the
> +      ``rpm-sequoia`` recipe.

Messed up the alignment starting from here...

> +  -  The ``libsass`` and ``sassc`` for the C/C++ port of the Sass CSS
> +     pre-compiler, required by the ``libadwaita`` recipe.
> +
> +  -  ``python3-roman-numerals-py``: module providing utilities for worki=
ng with
> +     well-formed Roman numerals. ``python3-sphinx`` relies on this recip=
e.
> +
> +  -  The ``fastfloat`` recipe, a header-only library for fast number par=
sing.
> +     This will be a dependency for the ``vte`` recipe in later versions.
> +
> +  -  The ``avahi-libnss-mdns`` was renamed from ``libnss-mdns``.
> +
> +  -  The ``cargo-c`` was renamed from ``cargo-c-native``.
> +
> +  -  The ``tcl8`` recipe was added to support the failing build of ``exp=
ect``.
> +     The ``tcl`` recipe (version 9) remains the main recipe for this com=
ponent.
> +

...up to there. Will fix in v2.

>  -  New core classes:
> =20
>     -  New :ref:`ref-classes-uki` class for building Unified Kernel Image=
s (UKI).
> @@ -79,12 +157,23 @@ New Features / Enhancements in |yocto-ver|
>        this class. This class also strips potential build paths in the co=
mpilation
>        output for reproducibility.
> =20
> +   -  New :ref:`ref-classes-ptest-python-pytest` class to automatically
> +      configure :ref:`ref-classes-ptest` for Python packages using the `=
pytest
> +      <https://docs.pytest.org>`__ unit test framework.
> +
>  -  Architecture-specific changes:
> =20
>     -  ``tune-cortexa32``: set tune feature to ``armv8a``.
> =20
> +   -  Add the ``loongarch64`` architecture for the ``grub2`` and ``llvm`=
`
> +      recipes. It was also added to build with ``musl`` as the toolchain=
.
> +
>  -  QEMU / ``runqemu`` changes:
> =20
> +   -  ``qemu/machine``: change the  ``QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}`=
` syntax
> +      in QEMU machine definitions to ``QEMU_EXTRAOPTIONS:tune-${TUNE_PKG=
ARCH}``
> +      to follow the same patterns as other QEMU-related variables.
> +
>  -  Documentation changes:
> =20
>     -  Use ``rsvg`` as a replacement of ``inkscape`` to convert svg files=
 in the
> @@ -93,6 +182,10 @@ New Features / Enhancements in |yocto-ver|
>     -  The ``cve`` role was replaced by ``cve_nist`` to avoid a conflict =
with
>        more recent version of Sphinx.
> =20
> +   -  New documentation on the multiconfig feature: :doc:`/dev-manual/mu=
lticonfig`.
> +
> +   -  New documentation on ``bblock``: :doc:`/dev-manual/bblock`.
> +
>  -  Go changes:
> =20
>     -  The :ref:`ref-classes-go-mod` class now sets an internal variable
> @@ -116,6 +209,9 @@ New Features / Enhancements in |yocto-ver|
>     -  Add the variable :term:`WIC_SECTOR_SIZE` to control the sector siz=
e of Wic
>        images.
> =20
> +   -  ``bootimg-efi``: Support "+" symbol in filenames passed in
> +      :term:`IMAGE_EFI_BOOT_FILES`.
> +
>  -  SDK-related changes:
> =20
>     -  Add support for ZST-compression through :term:`SDK_ARCHIVE_TYPE`, =
by
> @@ -126,6 +222,11 @@ New Features / Enhancements in |yocto-ver|
> =20
>     -  Enable ``ipv6``, ``acl``, and ``xattr`` in :term:`DISTRO_FEATURES_=
NATIVESDK`.
> =20
> +   -  Toolchain SDKs (``meta-toolchain``) now properly supports the ``us=
rmerge``
> +      feature (part of :term:`DISTRO_FEATURES`).
> +
> +   -  The ``pipefail`` shell option is now added to the SDK installer sc=
ript.
> +
>  -  Testing-related changes:
> =20
>     -  ``oeqa/postactions``: Fix archive retrieval from target.
> @@ -144,8 +245,12 @@ New Features / Enhancements in |yocto-ver|
> =20
>     -  ``oeqa/selftest``: add a test for bitbake "-e" and "-getvar" diffe=
rence.
> =20
> +   -  ``oeqa/selftest``: Fix failure when configuration contains ``BBLAY=
ERS:append``
> +
>     -  ``oeqa/ssh``: improve performance and log sizes when handling larg=
e files.
> =20
> +   -  ``oeqa/poisoning``: fix and improve gcc include poisoning tests.
> +
>  -  Utility script changes:
> =20
>     -  The ``patchreview.py`` script now uses the ``check_upstream_status=
`` from
> @@ -172,19 +277,42 @@ New Features / Enhancements in |yocto-ver|
>           :term:`CHECKLAYER_REQUIRED_TESTS` to get the list of QA checks =
to verify
>           when running the ``yocto-check-layer`` script.
> =20
> +   -  New ``oe-image-files-spdx`` script utility directory under
> +      ``scripts/contrib`` to that processes the SPDX 3.0.1 output from a=
 build
> +      and lists all the files on the root file system with their checksu=
ms.
> +
>  -  BitBake changes:
> =20
> -   -  ``fetch2``: do not preserve ownership when unpacking.
> +   -  Add a new ``include_all`` directive, which can be used to include =
multiple
> +      files present in the same location in different layers.
> +
> +   -  Fetcher related changes (``fetch2``):
> +
> +      -  Do not preserve ownership when unpacking.
> +
> +      -  switch from Sqlite ``persist_data`` to a standard cache file
> +         for checksums, and drop ``persist_data``.
> +
> +      -  add support for GitHub codespaces by adding the
> +         ``GITHUB_TOKEN`` to the list of variables exported during ``git=
``
> +         invocations.
> =20
> -   -  ``fetch2``: switch from Sqlite ``persist_data`` to a standard cach=
e file
> -      for checksums, and drop ``persist_data``.
> +      -  set User-Agent to 'bitbake/version' instead of a "fake
> +         mozilla" user agent.
> =20
> -   -  ``fetch2``: add support for GitHub codespaces by adding the
> -      ``GITHUB_TOKEN`` to the list of variables exported during ``git``
> -      invocations.
> +      -  ``wget``: handle HTTP 308 Permanent Redirect.
> =20
> -   -  ``fetch2``: set User-Agent to 'bitbake/version' instead of a "fake
> -      mozilla" user agent.
> +      -  ``wget``: increase timeout to 100s from 30s to match CDN worst
> +         response time.
> +
> +      -  Add support for fast initial shallow fetch. The fetcher will pr=
efer an
> +         initial shallow clone, but will re-utilize an existing bare clo=
ne if
> +         there is one. If the remote server does not allow shallow fetch=
es, the
> +         fetcher falls back to a bare clone. This improves the data tran=
sfer
> +         size on the initial fetch of a repository, eliminates the need =
to use
> +         an HTTPS tarball :term:`SRC_URI` to reduce data transfer, and a=
llows
> +         SSH-based authentication when using non-public repos, so additi=
onal
> +         HTTPS tokens may not be required.
> =20
>     -  ``compress``: use ``lz4`` instead of ``lz4c``, as ``lz4c`` as been
>        considered deprecrated since 2018.
> @@ -192,14 +320,13 @@ New Features / Enhancements in |yocto-ver|
>     -  ``server/process``: decrease idle/main loop frequency, as it is id=
le and
>        main loops have socket select calls to know when to execute.
> =20
> -   -  ``bitbake-worker``: improve bytearray truncation performance when =
large
> -       amounts of data are being transferred from the cooker to the work=
er.
> +   -  ``bitbake-worker``:
> =20
> -   -  ``bitbake-worker/cooker``: increase the default pipe size from 64K=
B to
> -      512KB for better efficiency when transferring large amounts of dat=
a.
> +      -  improve bytearray truncation performance when large
> +         amounts of data are being transferred from the cooker to the wo=
rker.
> =20
> -   -  ``fetch/wget``: increase timeout to 100s from 30s to match CDN wor=
st
> -      response time.
> +      -  ``cooker``: increase the default pipe size from 64KB to
> +         512KB for better efficiency when transferring large amounts of =
data.
> =20
>     -  ``bitbake-getvar``: catch ``NoProvider`` exception to improve erro=
r
>        readability when a recipe is not found with ``--recipe``.
> @@ -219,6 +346,18 @@ New Features / Enhancements in |yocto-ver|
>     -  ``knotty`` now hints the user if :term:`MACHINE` was not set in
>        the ``local.conf`` file.
> =20
> +   -  ``utils``: add Go mod h1 checksum support, specific to Go modules.=
 Use
> +      with ``goh1``.
> +
> +   -  The parser now catches empty variable name assignments such as::
> +
> +         +=3D "value"
> +
> +      The previous code would have assigned ``value`` to the variable na=
med ``+``.
> +
> +   -  ``hashserv``: Add the ``gc-mark-stream`` command for batch hash ma=
rking.
> +
> +
>  -  Packaging changes:
> =20
>     -  ``systemd``: extract dependencies from ``.note.dlopen`` ELF segmen=
ts, to
> @@ -235,13 +374,18 @@ New Features / Enhancements in |yocto-ver|
> =20
>  -  LLVM related changes:
> =20
> +   -  Set ``LLVM_HOST_TRIPLE`` for cross-compilation, which is recommend=
ed when
> +      cross-compiling Llvm.
> +
>  -  SPDX-related changes:
> =20
> -   -  SPDX 3.0: Find local sources when searching for debug sources.
> +   -  SPDX 3.0:
> =20
> -   -  SPDX 3.0: Map ``gitsm`` URIs to ``git``.
> +      -  Find local sources when searching for debug sources.
> =20
> -   -  SPDX 3.0: Link license and build by alias instead of SPDX ID.
> +      -  Map ``gitsm`` URIs to ``git``.
> +
> +      -  Link license and build by alias instead of SPDX ID.
> =20
>     -  Fix SPDX tasks not running when code changes (use of ``file-checks=
ums``).
> =20
> @@ -256,6 +400,14 @@ New Features / Enhancements in |yocto-ver|
>        ``devtool modify my-recipe --debug-build`` followed by
>        ``devtool ide-sdk my-recipe my-image``.
> =20
> +   -  ``create-spdx``: support line numbers for :term:`NO_GENERIC_LICENS=
E`
> +      license types.
> +
> +   -  ``spdx30``: Adds a "contains" relationship that relates the root f=
ile
> +      system package to the files contained in it. If a package provides=
 a file
> +      with a matching hash and path, it will be linked, otherwise a new =
File
> +      element will be created.
> +
>  -  Patchtest-related changes:
> =20
>     -  Refactor pattern definitions in a ``patterns`` module.
> @@ -299,6 +451,8 @@ New Features / Enhancements in |yocto-ver|
>        currently prints warning message for every unpatched CVE the
>        :ref:`ref-classes-cve-check` class finds.
> =20
> +   -  Allow choosing the CVE feed with :term:`NVD_DB_VERSION`.
> +
>  -  New :term:`PACKAGECONFIG` options for individual recipes:
> =20
>        -  ``perf``: ``zstd``
> @@ -308,15 +462,61 @@ New Features / Enhancements in |yocto-ver|
>        -  ``libpam``: ``selinux``
>        -  ``libsecret``: ``pam``
>        -  ``rpm``: ``sequoia``
> +      -  ``systemd``: ``apparmor``, ``fido``, ``mountfsd``, ``nsresource=
d``
> +      -  ``ovmf``: ``debug``

Also here, will fix in v2.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

