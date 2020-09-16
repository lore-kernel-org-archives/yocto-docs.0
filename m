Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.22870.1600264642502225465
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 06:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KFL0nB25;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id x8so5485420ybm.3
        for <docs@lists.yoctoproject.org>; Wed, 16 Sep 2020 06:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5JIMFrMERYaXT07SNPZQXtP6Ad6cgyfPtglUSFlzmBg=;
        b=KFL0nB25aMei2igiR7WnllwTIHohWle34+nGB39EBI1qUfqbjO3VfHV5hyV3L8zp23
         XGCUsNNShgeWazulB/QqUYHr23Pm2QrkS3OH6mR2LZnRaYP1oxPJLwfWKN2p3UKYF/do
         IVqtBAe5UpHZ8sZ+64UmESbz7g1DR3o+lqOe2vJoEeCgBsA9JI3yIs1dXchXHJWKLx3N
         yAP4h5hCq+yyknF9UMZ5k3nfAV9jSzBgRepxz7AlSnzpAD3t4vl8wFFV97O9Wx3lkY0m
         Y1twk+fC0ZH4cBSQQpvOBF8gUjGWwSBAGNrRIIAhPuT9VCJSLIWz76SgolAYxoO1RKaF
         coHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5JIMFrMERYaXT07SNPZQXtP6Ad6cgyfPtglUSFlzmBg=;
        b=M/TM4VxYcLCik7mg1r5CqpLKcJDK7kFqI+amR5YaucuvHacXfEVyupHWVJOBzbmBtn
         UpIAgm9qCGZLGqEcyhbo2zJlXayRUUrJKxhRThDwak8w76v5X5Ig0OC9BDCRj6ywMGFo
         vCRpNr9yIoybqjuxMV4qtH4WrtBbStn27g5aPsbH4gUvIq2B01RnK0f9FwqKtQ+wNr33
         28QNX9I7fEozFn7Y0Freg+2aV6SP5ST1epW9Cs4EkT5C5XtKXi2U2PGoy/ETnAu0FH6e
         Fy9sRPqtEk6qzbFOOCujbsAzIMQ4Fs90B/Cf49FLlKoz8LznvjUao8zV0blZdnsz6syP
         zkhw==
X-Gm-Message-State: AOAM5305lwudRmNg04eX3IafgGz6aeOEQgNT9p8/HhvalTWXANGolWio
	Do+mjqBmDAU4+MKWUmtwleJwL7okifyJapYZmFBVzg==
X-Google-Smtp-Source: ABdhPJy+6p8n7+9zGxFpA6/PAXkipDfoWjk/3/yVS9Q5uKffsL3wpSE8cn48YJQbZQHKpXMOqIbzFj8cl16jcmRlqSc=
X-Received: by 2002:a25:bfcf:: with SMTP id q15mr5156321ybm.133.1600264641377;
 Wed, 16 Sep 2020 06:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200915190112.16269-1-mark.morton@windriver.com>
In-Reply-To: <20200915190112.16269-1-mark.morton@windriver.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 16 Sep 2020 15:57:10 +0200
Message-ID: <CAP71WjyH16-XhPHSKm2CNUe186oJwZ2rsN1QyrBo2i==UT+ARw@mail.gmail.com>
Subject: Re: [docs] [PATCH] Updated codeblocks and links part 2 for consistency, minor edits
To: Mark Morton <Mark.Morton@windriver.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Mark,

On Tue, Sep 15, 2020 at 9:06 PM Mark Morton <Mark.Morton@windriver.com> wr=
ote:
>
> Signed-off-by: Mark Morton <mark.morton@windriver.com>

thanks! I just pushed the test-manual updates in the sphinx branch. I
squashed both of your commit, and I added a few additional fixup of
mine as well (also squashed them). There was something weird with many
URL link, you had many links like this:

`https://docs.python.org/3/library/unittest.html <#>`__

I think they should simply be:

https://docs.python.org/3/library/unittest.html

http links are managed automatically.

there were a couple of indentation issues (when nesting literal blocks
in lists), and I fixed them.

If you are curious, here is the patch I had on top of your 2 patches,
before I squashed them all.

https://git.linaro.org/people/nicolas.dechesne/yocto-docs.git/commit/?h=3D=
review&id=3D718b075634ad827682a3389359b66cf0c0de41b7

If you notice anything wrong, please send a patch on top of 'sphinx' branc=
h.

> ---
>  .../test-manual/test-manual-intro.rst         | 31 +++++++++----------
>  .../test-manual-understand-autobuilder.rst    | 18 +++++------
>  2 files changed, 22 insertions(+), 27 deletions(-)
>
> diff --git a/documentation/test-manual/test-manual-intro.rst b/documenta=
tion/test-manual/test-manual-intro.rst
> index d68ab73f4..62e23a297 100644
> --- a/documentation/test-manual/test-manual-intro.rst
> +++ b/documentation/test-manual/test-manual-intro.rst
> @@ -27,14 +27,14 @@ loaded with information from the README files and no=
tes from key
>  engineers:
>
>  -  *yocto-autobuilder2:* This
> -   `README.md <http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobui=
lder2/tree/README.md>`__
> +   :yocto-git:`README.md </cgit.cgi/yocto-autobuilder2/tree/README.md>`
>     is the main README which detials how to set up the Yocto Project
>     Autobuilder. The ``yocto-autobuilder2`` repository represents the
>     Yocto Project's console UI plugin to Buildbot and the configuration
>     necessary to configure Buildbot to perform the testing the project
>     requires.
>
> --  *yocto-autobuilder-helper:* This `README <http://git.yoctoproject.or=
g/clean/cgit.cgi/yocto-autobuilder-helper/tree/README/>`__
> +-  *yocto-autobuilder-helper:* This :yocto-git:`README </cgit.cgi/yocto=
-autobuilder-helper/tree/README/>`
>     and repository contains Yocto Project Autobuilder Helper scripts and
>     configuration. The ``yocto-autobuilder-helper`` repository contains
>     the "glue" logic that defines which tests to run and how to run them=
.
> @@ -65,9 +65,9 @@ that the Yocto Project customizes using code from the
>  resulting UI plug-in allows you to visualize builds in a way suited to
>  the project's needs.
>
> -A helper layer provides configuration and job management through
> +A ``helper`` layer provides configuration and job management through
>  scripts found in the ``yocto-autobuilder-helper`` repository. The
> -helper layer contains the bulk of the build configuration
> +``helper`` layer contains the bulk of the build configuration
>  information and is release-specific, which makes it highly customizable
>  on a per-project basis. The layer is CI system-agnostic and contains a
>  number of Helper scripts that can generate build configurations from
> @@ -137,10 +137,8 @@ thefollowing types of tests:
>
>     $ bitbake image -c testimage
>
> -   The tests utilize the
> -   :ref:`testimage* <ref-classes-testimage*>`
> -   classes and the
> -   :ref:`ref-tasks-testimage` task.
> +   The tests utilize the :ref:`testimage* <ref-classes-testimage*>`
> +   classes and the :ref:`ref-tasks-testimage` task.
>
>  -  *Layer Testing:* The Autobuilder has the possibility to test whether
>     specific layers work with the test of the system. The layers tested
> @@ -155,9 +153,11 @@ thefollowing types of tests:
>     ":yocto_wiki:`Ptest </wiki/Ptest>`" Wiki page for more
>     information on Ptest.
>
> --  *SDK Testing:* Image tests initiated through the following command: =
$
> -   bitbake image -c testsdk The tests utilize the
> -   :ref:`testsdk <ref-classes-testsdk>` class and
> +-  *SDK Testing:* Image tests initiated through the following command::
> +
> +   $ bitbake image -c testsdk
> +
> +   The tests utilize the :ref:`testsdk <ref-classes-testsdk>` class and
>     the ``do_testsdk`` task.
>
>  -  *Unit Testing:* Unit tests on various components of the system run
> @@ -253,12 +253,9 @@ Tests map into the codebase as follows:
>     -  These tests build an image, boot it, and run tests against the
>        image's content.
>
> -   -  The code for these tests resides in
> -      ``meta/lib/oeqa/runtime/cases/``.
> +   -  The code for these tests resides in ``meta/lib/oeqa/runtime/cases=
/``.
>
> -   -  You need to set the
> -      :term:`IMAGE_CLASSES`
> -      variable as follows::
> +   -  You need to set the :term:`IMAGE_CLASSES` variable as follows::
>
>        IMAGE_CLASSES +=3D "testimage"
>
> @@ -321,7 +318,7 @@ Test Examples
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  This section provides example tests for each of the tests listed in the
> -`How Tests Map to Areas of Code <#test-test-mapping>`__ section.
> +:ref:`test-manual/test-manual-intro:How Tests Map to Areas of Code` sec=
tion.
>
>  For oeqa tests, testcases for each area reside in the main test
>  directory at ``meta/lib/oeqa/selftest/cases`` directory.
> diff --git a/documentation/test-manual/test-manual-understand-autobuilde=
r.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
> index 0d987d245..691e4de39 100644
> --- a/documentation/test-manual/test-manual-understand-autobuilder.rst
> +++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
> @@ -82,11 +82,11 @@ For each given target in a build, the Autobuilder ex=
ecutes several
>  steps. These are configured in ``yocto-autobuilder2/builders.py`` and
>  roughly consist of:
>
> -1. *Run ``clobberdir``*
> +1. *Run clobberdir*.
>
>     This cleans out any previous build. Old builds are left around to
>     allow easier debugging of failed builds. For additional information,
> -   see :ref:`test-clobberdir`.
> +   see :ref:`test-manual/test-manual-understand-autobuilder:clobberdir`=
.
>
>  2. *Obtain yocto-autobuilder-helper*
>
> @@ -110,7 +110,7 @@ roughly consist of:
>     from the ``layerinfo.json`` file to help understand the
>     configuration. It will also use a local cache of repositories to
>     speed up the clone checkouts. For additional information, see
> -   :ref:`test-autobuilder-clone-cache`.
> +   :ref:`test-manual/test-manual-understand-autobuilder:Autobuilder Clo=
ne Cache`.
>
>     This step has two possible modes of operation. If the build is part
>     of a parent build, its possible that all the repositories needed may
> @@ -153,7 +153,7 @@ special script that moves files to a special locatio=
n, rather than
>  deleting them. Files in this location are deleted by an ``rm`` command,
>  which is run under ``ionice -c 3``. For example, the deletion only
>  happens when there is idle IO capacity on the Worker. The Autobuilder
> -Worker Janitor runs this deletion. See :ref:`test-autobuilder-worker-ja=
nitor`.
> +Worker Janitor runs this deletion. See :ref:`test-manual/test-manual-un=
derstand-autobuilder:Autobuilder Worker Janitor`.
>
>  .. _test-autobuilder-clone-cache:
>
> @@ -165,8 +165,7 @@ on the Autobuilder. We therefore have a stash of com=
monly used
>  repositories pre-cloned on the Workers. Data is fetched from these
>  during clones first, then "topped up" with later revisions from any
>  upstream when necesary. The cache is maintained by the Autobuilder
> -Worker Janitor. See :ref:`Autobuilder Worker
> -Janitor`.
> +Worker Janitor. See :ref:`test-manual/test-manual-understand-autobuilde=
r:Autobuilder Worker Janitor`.
>
>  .. _test-autobuilder-worker-janitor:
>
> @@ -174,8 +173,7 @@ Autobuilder Worker Janitor
>  --------------------------
>
>  This is a process running on each Worker that performs two basic
> -operations, including background file deletion at IO idle (see Target
> -Execution: clobberdir :ref:`test-list-tgt-exec-clobberdir`) and
> +operations, including background file deletion at IO idle (see :ref:`te=
st-manual/test-manual-understand-autobuilder:Autobuilder Target Execution O=
verview`: Run clobberdir) and
>  maintainenance of a cache of cloned repositories to improve the speed
>  the system can checkout repositories.
>
> @@ -196,7 +194,7 @@ Shared SSTATE_DIR
>
>  The Workers are all connected over NFS which allows the ``sstate``
>  directory to be shared between them. This means once a Worker has built
> -an artefact, all the others can benefit from it. Usage of the directory
> +an artifact, all the others can benefit from it. Usage of the directory
>  within the directory is designed for sharing over NFS.
>
>  .. _test-resulttool:
> @@ -263,7 +261,7 @@ of post-build steps, including:
>     generated to the remote server.
>
>  4. Cleanup the build directory using
> -   :ref:`test-clobberdir` if the build was successful,
> +   :ref:`test-manual/test-manual-understand-autobuilder:clobberdir` if =
the build was successful,
>     else rename it to =E2=80=9Cbuild-renamed=E2=80=9D for potential futu=
re debugging.
>
>  .. _test-deploying-yp-autobuilder:
> --
> 2.17.1
>
>
>=20
>
