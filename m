Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8610.1603890745730231458
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 06:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.109.234
Received: from [192.168.13.190] (80-110-109-234.cgn.dynamic.surfer.at [80.110.109.234])
	(Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 72E861C000C;
	Wed, 28 Oct 2020 13:12:23 +0000 (UTC)
Date: Wed, 28 Oct 2020 14:12:14 +0100
In-Reply-To: <18956e99fafa0d898c37a785e44015af2eb532d8.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com> <18956e99fafa0d898c37a785e44015af2eb532d8.1603839557.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Subject: Re: [docs] [PATCH 7/7] ref-manual: add migration section for 3.2
To: docs@lists.yoctoproject.org,Paul Eggleton <paul.eggleton@linux.microsoft.com>
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <7E52934A-D7A4-42D7-8AE8-ED1E6EB60DA6@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On October 28, 2020 2:18:35 AM GMT+01:00, Paul Eggleton <paul=2Eeggleton@l=
inux=2Emicrosoft=2Ecom> wrote:
>+In addition, pseudo's behaviour on mismatches has now been changed -
>rather
>+than doing what turns out to be a rather dangerous "fixup" if it sees
>a file
>+with a different path but the same inode as another file it has
>previously seen,
>+pseudo will throw an ``abort()`` and direct you to a `wiki page
><https://wiki=2Eyoctoproject=2Eorg/wiki/Pseudo_Abort>`

:yocto_wiki:`wiki page </wiki/Pseudo_Abort>`

>+that explains how to deal with this=2E
>+
>+
>+=2E=2E _migration-3=2E2-packagegroup-core-device-devel:
>+
>+packagegroup-core-device-devel no longer included in images built for
>qemu* machines
>+------------------------------------------------------------------------=
------------
>+
>+``packagegroup-core-device-devel`` was previously added automatically
>to
>+images build for ``qemu*`` machines, however the purpose of the group

s/build/built/?

>and what
>+it should contain is no longer clear, and in general, adding userspace
>+development items to images is best done at the image/class level;
>thus this
>+packagegroup was removed=2E
>+
>+This packagegroup previously pulled in the following:
>+
>+- ``distcc-config``
>+- ``nfs-export-root``
>+- ``bash``
>+- ``binutils-symlinks``
>+
>+If you still need any of these in your image build for a ``qemu*``

s/build/built/?

>machine
>+then you will add them explicitly to :term:`IMAGE_INSTALL` or another
>+appropriate place in the dependency chain for your image (if you have
>not
>+already done so)=2E
>+
>+
>+=2E=2E _migration-3=2E2-dhcp:
>+
>+DHCP server/client replaced
>+---------------------------
>+
>+The ``dhcp`` software package has become unmaintained and thus has
>been
>+functionally replaced by ``dhcpcd`` (client) and ``kea`` (server)=2E You
>will
>+need to replace references to the recipe/package names as appropriate
>- most
>+commonly, at the package level ``dhcp-client`` should be replaced by
>+``dhcpcd`` and ``dhcp-server`` should be replaced by ``kea``=2E If you
>have any
>+custom configuration files for these they will need to be adapted -
>refer to
>+the upstream documentation for ``dhcpcd`` and ``kea`` for further
>details=2E
>+
>+
>+=2E=2E _migration-3=2E2-packaging-changes:
>+
>+Packaging changes
>+-----------------
>+
>+- ``python3``: the ``urllib`` python package has now moved into the
>core package, as it is used more commonly than just netclient (e=2Eg=2E
>email, xml, mimetypes, pydoc)=2E In addition, the ``pathlib`` module is
>now also part of the core package=2E
>+
>+- ``iptables``: ``iptables-apply`` and ``ip6tables-apply`` have been
>split out to their own package to avoid a bash dependency in the main
>``iptables`` package
>+
>+
>+=2E=2E _migration-3=2E2-package-qa-checks:
>+
>+Package QA check changes
>+------------------------
>+
>+Previously, the following package QA checks triggered warnings,
>however they can
>+be indicators of genuine underlying problems and are therefore now
>treated as
>+errors:
>+
>+- :ref:`already-stripped <qa-check-already-stripped>`
>+- :ref:`compile-host-path <qa-check-compile-host-path>`
>+- :ref:`installed-vs-shipped <qa-check-installed-vs-shipped>`
>+- :ref:`ldflags <qa-check-ldflags>`
>+- :ref:`pn-overrides <qa-check-pn-overrides>`
>+- :ref:`rpaths <qa-check-rpaths>`
>+- :ref:`staticdev <qa-check-staticdev>`
>+- :ref:`unknown-configure-option <qa-check-unknown-configure-option>`
>+- :ref:`useless-rpaths <qa-check-useless-rpaths>`
>+
>+In addition, the following new checks were added and default to
>triggering an error:
>+
>+- :ref:`shebang-size <qa-check-shebang-size>`: Check for shebang (#!)
>lines longer than 128 characters, which can give an error at runtime
>depending on the operating system=2E
>+
>+- :ref:`unhandled-features-check <qa-check-unhandled-features-check>`:
>Check if any of the variables supported by the :ref:`features_check
><ref-classes-features_check>` class is set while not inheriting the
>class itself=2E
>+
>+- :ref:`missing-update-alternatives
><qa-check-missing-update-alternatives>`: Check if the recipe sets the
>:term:`ALTERNATIVE` variable for any of its packages, and does not
>inherit the :ref:`update-alternatives
><ref-classes-update-alternatives>` class=2E
>+

If you rename the references to ref-qa-checks-<qa-check> don't forget to c=
hange them here too=2E

>+- A trailing slash or duplicated slashes in the value of :term:`S` or
>:term:`B` will now trigger a warning so that they can be removed and
>path comparisons can be more reliable - remove any instances of these
>in your recipes if the warning is displayed=2E
>+
>+
>+=2E=2E _migration-3=2E2-src-uri-file-globbing:
>+
>+Globbing no longer supported in ``file://`` entries in ``SRC_URI``
>+------------------------------------------------------------------
>+
>+Globbing (``*`` and ``?`` wildcards) in ``file://`` URLs within
>:term:`SRC_URI`
>+did not properly support file checksums, thus changes to the source
>files
>+would not always change the do_fetch task checksum, and consequently
>would
>+not ensure that the changed files would be incorporated in subsequent
>builds=2E
>+
>+Unfortunately it is not practical to make globbing work generically
>here, so
>+the decision was taken to remove support for globs in ``file://``
>URLs=2E
>+If you have any usage of these in your recipes, then you will now need
>to
>+either add each of the files that you expect to match explicitly, or
>+alternatively if you still need files to be pulled in dynamically, put
>the
>+files into a subdirectory and reference that instead=2E
>+
>+
>+=2E=2E _migration-3=2E2-deploydir-clean:
>+
>+deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
>+----------------------------------------------------------
>+
>+``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>`
>class now cleans up ${:term:`DEPLOYDIR`} before running, just as
>``do_install`` cleans up ${:term:`D`} before running=2E This reduces the
>risk of DEPLOYDIR being accidentally contaminated by files from

``DEPLOYDIR``?

>previous runs, possibly even with different config, in case of
>incremental builds=2E
>+
>+Most recipes and classes that inherit the ``deploy`` class or interact
>with ``do_deploy`` are unlikely to be affected by this unless they add
>``prefuncs`` to ``do_deploy`` *which also* put files into
>``${DEPLOYDIR}`` - these should be refactored to use
>``do_deploy_prepend`` instead=2E
>+
>+
>+=2E=2E _migration-3=2E2-nativesdk-sdk-provides-dummy:
>+
>+Custom SDK / SDK-style recipes need to include
>``nativesdk-sdk-provides-dummy``
>+------------------------------------------------------------------------=
-------
>+
>+All ``nativesdk`` packages require ``/bin/sh`` due to their
>postinstall scriptlets, thus this package has to be dummy-provided
>within the SDK and ``nativesdk-sdk-provides-dummy`` now does this=2E If
>you have a custom SDK recipe (or your own SDK-style recipe similar to
>e=2Eg=2E ``buildtools-tarball``), you will need to ensure
>``nativesdk-sdk-provides-dummy`` or an equivalent is included in
>:term:`TOOLCHAIN_HOST_TASK`=2E
>+
>+
>+``ld=2Eso=2Econf`` now moved back to main ``glibc`` package
>+-------------------------------------------------------
>+
>+There are cases where one doesn't want ldconfig on target (e=2Eg=2E for

``ldconfig``?

Quentin
