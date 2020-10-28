Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2179.1603847917887243449
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=GcmQoH+m;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 6E8FC209E515; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6E8FC209E515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=Z5YsKlVJ8gi/kj9voZLka3hgUcXj73An5gTSxadzBr0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GcmQoH+moAvewGoQeipDhgJJOFy6RQKwa4MTbm9sNxpSOlnhTEApG0U88rzIya7Gm
	 qhjLDpo9gnpXRWBaJKqLx9jcn4Rff2ILXY0i2B0weWRf7aAwvAnc3CQHV0vlDn2Mr2
	 9huQWVgqm4SBMD6vkvJyDUC/hhDCwEOhEFgvKZek=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/7] ref-manual: QA check updates
Date: Tue, 27 Oct 2020 18:18:31 -0700
Message-Id: <9702c67ec3b613767e2a97b3b1730ed70da298dd.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Paul Eggleton <paul.eggleton@microsoft.com>

* Update for changes to messages
* Add missing QA checks - some added recently, others several releases
  ago

Some of this was borrowed from commit messages (with editing) - in
particular thanks to Alexander Kanavin for the writeup on patch-fuzz.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-qa-checks.rst | 207 +++++++++++++++++++++++=
+++++-
 1 file changed, 200 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/ref-qa-checks.rst b/documentation/r=
ef-manual/ref-qa-checks.rst
index 228b4fd..54977dc 100644
--- a/documentation/ref-manual/ref-qa-checks.rst
+++ b/documentation/ref-manual/ref-qa-checks.rst
@@ -157,7 +157,7 @@ Errors and Warnings
    =C2=A0
 .. _qa-check-arch:
=20
--  ``Architecture did not match (<machine_arch> to <file_arch>) on <file=
> [arch]``
+-  ``Architecture did not match (<file_arch>, expected <machine_arch>) i=
n <file> [arch]``
=20
    By default, the OpenEmbedded build system checks the Executable and
    Linkable Format (ELF) type, bit size, and endianness of any binaries
@@ -175,7 +175,7 @@ Errors and Warnings
=20
    =C2=A0
=20
--  ``Bit size did not match (<machine_bits> to <file_bits>) <recipe> on =
<file> [arch]``
+-  ``Bit size did not match (<file_bits>, expected <machine_bits>) in <f=
ile> [arch]``
=20
    By default, the OpenEmbedded build system checks the Executable and
    Linkable Format (ELF) type, bit size, and endianness of any binaries
@@ -193,7 +193,7 @@ Errors and Warnings
=20
    =C2=A0
=20
--  ``Endianness did not match (<machine_endianness> to <file_endianness>=
) on <file> [arch]``
+-  ``Endianness did not match (<file_endianness>, expected <machine_endi=
anness>) in <file> [arch]``
=20
    By default, the OpenEmbedded build system checks the Executable and
    Linkable Format (ELF) type, bit size, and endianness of any binaries
@@ -232,7 +232,7 @@ Errors and Warnings
    =C2=A0
 .. _qa-check-ldflags:
=20
--  ``No GNU_HASH in the elf binary: '<file>' [ldflags]``
+-  ``File '<file>' in package '<package>' doesn't have GNU_HASH (didn't =
pass LDFLAGS?) [ldflags]``
=20
    This indicates that binaries produced when building the recipe have
    not been linked with the :term:`LDFLAGS` options
@@ -387,7 +387,7 @@ Errors and Warnings
    =C2=A0
 .. _qa-check-configure-unsafe:
=20
--  ``This autoconf log indicates errors, it looked at host include and/o=
r library paths while determining system capabilities. Rerun configure ta=
sk after fixing this. The path was '<path>'``
+-  ``This autoconf log indicates errors, it looked at host include and/o=
r library paths while determining system capabilities. Rerun configure ta=
sk after fixing this. [configure-unsafe]``
=20
    The log for the :ref:`ref-tasks-configure` task
    indicates that paths on the host were searched for files, which is
@@ -461,7 +461,15 @@ Errors and Warnings
    ``RDEPENDS =3D "value"``). If you receive this error, correct any
    assignments to these variables within your recipe.
=20
-   =C2=A0
+
+- ``recipe uses DEPENDS_${PN}, should use DEPENDS [pkgvarcheck]``
+
+   This check looks for instances of setting ``DEPENDS_${PN}``
+   which is erroneous (:term:`DEPENDS` is a recipe-wide variable and thu=
s
+   it is not correct to specify it for a particular package, nor will su=
ch
+   an assignment actually work.) Set ``DEPENDS`` instead.
+
+
 .. _qa-check-already-stripped:
=20
 -  ``File '<file>' from <recipename> was already stripped, this will pre=
vent future debugging! [already-stripped]``
@@ -548,7 +556,192 @@ Errors and Warnings
    words, any license in ``LICENSE_*`` should also appear in
    :term:`LICENSE`.
=20
-   =C2=A0
+
+.. _qa-check-configure-gettext:
+
+-  ``AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]``
+
+    If a recipe is building something that uses automake and the automak=
e
+    files contain an ``AM_GNU_GETTEXT`` directive then this check will f=
ail
+    if there is no ``inherit gettext`` statement in the recipe to ensure
+    that gettext is available during the build. Add ``inherit gettext`` =
to
+    remove the warning.
+
+
+.. _qa-check-mime:
+
+- ``package contains mime types but does not inherit mime: <packagename>=
 path '<file>' [mime]``
+
+   The specified package contains mime type files (``.xml`` files in
+   ``${datadir}/mime/packages``) and yet does not inherit the mime
+   class which will ensure that these get properly installed. Either
+   add ``inherit mime`` to the recipe or remove the files at the
+   ``do_install`` step if they are not needed.
+
+
+.. _qa-check-mime-xdg:
+
+- ``package contains desktop file with key 'MimeType' but does not inher=
t mime-xdg: <packagename> path '<file>' [mime-xdg]``
+
+    The specified package contains a .desktop file with a 'MimeType' key
+    present, but does not inherit the mime-xdg class that is required in
+    order for that to be activated. Either add ``inherit mime`` to the
+    recipe or remove the files at the ``do_install`` step if they are no=
t
+    needed.
+
+
+.. _qa-check-src-uri-bad:
+
+- ``<recipename>: SRC_URI uses unstable GitHub archives [src-uri-bad]``
+
+    GitHub provides "archive" tarballs, however these can be re-generate=
d
+    on the fly and thus the file's signature will not necessarily match =
that
+    in the SRC_URI checksums in future leading to build failures. It is
+    recommended that you use an official release tarball or switch to
+    pulling the corresponding revision in the actual git repository inst=
ead.
+
+
+- ``SRC_URI uses PN not BPN [src-uri-bad]``
+
+    If some part of :term:`SRC_URI` needs to reference the recipe name, =
it should do
+    so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will=
 change
+    for different variants of the same recipe e.g. when :term:`BBCLASSEX=
TEND`
+    or multilib are being used. This check will fail if a reference to `=
`${PN}``
+    is found within the ``SRC_URI`` value - change it to ``${BPN}`` inst=
ead.
+
+
+.. _qa-check-unhandled-features-check:
+
+- ``<recipename>: recipe doesn't inherit features_check [unhandled-featu=
res-check]``
+
+    This check ensures that if one of the variables that the :ref:`featu=
res_check <ref-classes-features_check>`
+    class supports (e.g. :term:`REQUIRED_DISTRO_FEATURES`) is used, then=
 the recipe
+    inherits ``features_check`` in order for the requirement to actually=
 work. If
+    you are seeing this message, either add ``inherit features_check`` t=
o your recipe
+    or remove the reference to the variable if it is not needed.
+
+
+.. _qa-check-missing-update-alternatives:
+
+- ``<recipename>: recipe defines ALTERNATIVE_<packagename> but doesn't i=
nherit update-alternatives. This might fail during do_rootfs later! [miss=
ing-update-alternatives]``
+
+    This check ensures that if a recipe sets the :term:`ALTERNATIVE` var=
iable that the
+    recipe also inherits :ref:`update-alternatives <ref-classes-update-a=
lternatives>` such
+    that the alternative will be correctly set up. If you are seeing thi=
s message, either
+    add ``inherit update-alternatives`` to your recipe or remove the ref=
erence to the variable
+    if it is not needed.
+
+
+.. _qa-check-shebang-size:
+
+- ``<packagename>: <file> maximum shebang size exceeded, the maximum siz=
e is 128. [shebang-size]``
+
+    This check ensures that the shebang line (``#!`` in the first line) =
for a script
+    is not longer than 128 characters, which can cause an error at runti=
me depending
+    on the operating system. If you are seeing this message then the spe=
cified script
+    may need to be patched to have a shorter in order to avoid runtime p=
roblems.
+
+
+.. _qa-check-perllocalpod:
+
+- ``<packagename> contains perllocal.pod (<files>), should not be instal=
led [perllocalpod]``
+
+    ``perllocal.pod`` is an index file of locally installed modules and =
so shouldn't be
+    installed by any distribution packages. The :ref:`cpan <ref-classes-=
cpan>` class
+    already sets ``NO_PERLLOCAL`` to stop this file being generated by m=
ost Perl recipes,
+    but if a recipe is using ``MakeMaker`` directly then they might not =
be doing this
+    correctly. This check ensures that perllocal.pod is not in any packa=
ge in order to
+    avoid multiple packages shipping this file and thus their packages c=
onflicting
+    if installed together.
+
+
+.. _qa-check-usrmerge:
+
+- ``<packagename> package is not obeying usrmerge distro feature. /<path=
> should be relocated to /usr. [usrmerge]``
+
+    If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensur=
e that no package
+    installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) d=
irectories. If you are seeing this
+    message, it indicates that the ``do_install`` step (or perhaps the b=
uild process that
+    ``do_install`` is calling into, e.g. ``make install`` is using hardc=
oded paths instead
+    of the variables set up for this (``bindir``, ``sbindir``, etc.), an=
d should be
+    changed so that it does.
+
+
+.. _qa-check-patch-fuzz:
+
+- ``Fuzz detected: <patch output> [patch-fuzz]``
+
+    This check looks for evidence of "fuzz" when applying patches within=
 the ``do_patch``
+    task. Patch fuzz is a situation when the ``patch`` tool ignores some=
 of the context
+    lines in order to apply the patch. Consider this example:
+
+    Patch to be applied: ::
+
+        --- filename
+        +++ filename
+         context line 1
+         context line 2
+         context line 3
+        +newly added line
+         context line 4
+         context line 5
+         context line 6
+
+    Original source code: ::
+
+        different context line 1
+        different context line 2
+        context line 3
+        context line 4
+        different context line 5
+        different context line 6
+
+    Outcome (after applying patch with fuzz): ::
+
+        different context line 1
+        different context line 2
+        context line 3
+        newly added line
+        context line 4
+        different context line 5
+        different context line 6
+
+    Chances are, the newly added line was actually added in a completely
+    wrong location, or it was already in the original source and was add=
ed
+    for the second time. This is especially possible if the context line=
 3
+    and 4 are blank or have only generic things in them, such as ``#endi=
f`` or ``}``.
+    Depending on the patched code, it is entirely possible for an incorr=
ectly
+    patched file to still compile without errors.
+
+    *How to eliminate patch fuzz warnings*
+
+    Use the ``devtool`` command as explained by the warning. First, unpa=
ck the
+    source into devtool workspace: ::
+
+            devtool modify <recipe>
+
+    This will apply all of the patches, and create new commits out of th=
em in
+    the workspace - with the patch context updated.
+
+    Then, replace the patches in the recipe layer: ::
+
+            devtool finish --force-patch-refresh <recipe> <layer_path>
+
+    The patch updates then need be reviewed (preferably with a side-by-s=
ide diff
+    tool) to ensure they are indeed doing the right thing i.e.:
+
+    #. they are applied in the correct location within the file;
+    #. they do not introduce duplicate lines, or otherwise do things tha=
t
+       are no longer necessary.
+
+    To confirm these things, you can also review the patched source code=
 in
+    devtool's workspace, typically in ``<build_dir>/workspace/sources/<r=
ecipe>/``
+
+    Once the review is done, you can create and publish a layer commit w=
ith
+    the patch updates that modify the context. Devtool may also refresh
+    other things in the patches, those can be discarded.
+
+
=20
 Configuring and Disabling QA Checks
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
1.8.3.1

