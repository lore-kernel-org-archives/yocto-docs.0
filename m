Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5185DC83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 17:25:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1195.1752600356977761436
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 10:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hlsm7mka;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LHQnPNNJW4V3qVgkkc7RsspkfyYanG+HohkFYepAhmM=; b=hlsm7mkatKP2HOw6dLv0yRKHOO
	h6telGE0fH8lwVNrCEUSa5RCsum5kJh1+82TwfCNl2GquX6aCjW5oP2VfCwdtZ2OAiqQX6eDhCK2k
	r0AWo9xn91XE/FfTIPHjgEX/WA5XZHrWKxMaBsob/P7UpwlA+Mc6B5Xzi80XDedAoqGIUTlNeBSCC
	H3SoOS7MJDhDFprGPe1NrO2vLRyNWXOehMFytgDT7GYYBJ/IMp4ZFWiLt+CkJGBgqv7WRwMAI4SWS
	cVZG9GFWBBnVXmX0cb/guYVtZFpn1ov71it8NPcbebvp9am47F6OkBEDVF7YUZRnJDqWUK7iPZlPn
	mNs5ZjvA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:55376 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ubjPb-0000000H8O9-30pD;
	Tue, 15 Jul 2025 13:25:55 -0400
Date: Tue, 15 Jul 2025 13:25:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: Khem Raj <raj.khem@gmail.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] pedantry: what is the proper descriptor for :append,
 :prepend and :remove
In-Reply-To: <a58d4dfe-a5c3-4610-8787-3d4d1ae1c859@cherry.de>
Message-ID: <9f7e7618-8b53-97e8-d6e8-479f681ecb4d@crashcourse.ca>
References: <3115a61f-25c2-5be5-d221-3b28314f07c1@crashcourse.ca> <CAMKF1sr=FxYFe93CS33SDGuq2JPreEjA1spXhaPe8ekTc2XUiA@mail.gmail.com> <fc752a82-1909-3cc4-0745-812ea30a8b76@crashcourse.ca> <a58d4dfe-a5c3-4610-8787-3d4d1ae1c859@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-639659414-1752600353=:1943712"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 17:25:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7339

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-639659414-1752600353=:1943712
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  I'll go over all this when I get a moment, but I want to thank
Quentin for the time he invests in educating (and generally
correcting) me.

On Tue, 15 Jul 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 7/15/25 11:27 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > On Mon, 14 Jul 2025, Khem Raj wrote:
> >
> > > On Mon, Jul 14, 2025 at 9:59 AM Robert P. J. Day via
> > > lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> > > wrote:
> > > >
> > > >
> > > >    I ask as I have seen documentation that describes those three things
> > > > as "overrides", apparently because they appear in the same place as
> > > > variable overrides, but that seems wildly misleading. It seems that
> > > > they should more properly be classified as "operators", and if that
> > > > was the case, I think some documentation could be made clearer by
> > > > distinguishing between "operators" and "overrides" when you see stuff
> > > > like:
> > > >
> > > >    VAR:append:arm
> > > >
> > > > that sort of thing. So what's the proper descriptor for those three
> > > > things?
> > >
> > > variable:operator:override
> >
> >    actually, i was asking about the proper descriptor for the three
> > things "append", "prepend" and "remove", but this is making my point
> > -- those three things are properly described as "operators", as
> > opposed to "overrides", so one might say that the correct syntax
>
> Both are correct.
>
> > would be:
> >
> >    VAR:operator:override(s) = ...
> >
> > in that order since, as quentin suggests:
> >
> >    VAR:override:append
> >
> > is almost always wrong. i remember asking about this distinction a
>
> Almost always wrong but still might be something you want, so we need to
> explain it. By explaining the difference between both, people would get a
> better understanding as to why it is most likely wrong for their usecase and
> maybe even have them go through their codebase to check if what they think
> works actually does work.
>
> A typical use-case where this makes sense is the following:
>
> do_install() {
> }
>
> do_install:class-target() {
> }
>
> If you want to add to the class-target version of the task only,
>
> do_install:append:class-target() {
> }
>
> will NOT do what you want, but
>
> do_install:class-target:append() {
> }
>
> will.
>
> The former will add its content to "vanilla"/"default" do_install whenever
> building for the target, but the actual do_install will actually be of the
> content of do_install:class-target, so you need to append to that.
>
> > long time ago, and that distinction is covered in the BB manual:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#examples
> >
> > but maybe that needs to be extended with this caveat -- that an
> > "operator" should precede any overrides in almost all cases, as i see
> > no actual valid use cases for that second, weird form.
> >
>
> I couldn't really find any actual user in poky, c.f.:
>
> $ git grep -w -E '.*:[-a-zA-Z0-9_]*:(append|prepend|remove)'
> bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst: A:foo:append
> = "X"
> bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst: A:foo:append
> = "Z"
> bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst: A:foo:append
> = "X"
> bitbake/lib/bb/tests/data.py: self.d.setVar("TEST:some_val:remove",
> "testvalue3")
> bitbake/lib/bb/tests/data.py:        self.d.setVar("TEST:bar:append",
> "testvalue2")
> documentation/migration-guides/release-notes-4.3.rst:
> ERROR_QA:layer-core:append = " patch-status"
> meta/conf/distro/include/no-gplv3.inc:RDEPENDS:packagegroup-core-full-cmdline-utils:remove
> = "bash bc coreutils cpio ed findutils gawk grep mc mc-shell mc-helpers
> mc-helpers-perl sed tar time"
> meta/conf/distro/include/no-gplv3.inc:RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove
> = "diffutils m4 make patch"
> meta/conf/distro/include/no-gplv3.inc:RDEPENDS:packagegroup-core-full-cmdline-multiuser:remove
> = "gzip"
> meta/conf/distro/include/no-gplv3.inc:RRECOMMENDS:packagegroup-base-vfat:remove
> = "dosfstools"
> meta/lib/oeqa/selftest/cases/bbtests.py:
> self.write_config('PV:pn-gitunpackoffline:append = "+${UNDEFVAL}"')
> meta/lib/oeqa/selftest/cases/uboot.py:IMAGE_FSTYPES:pn-core-image-minimal:append
> = " wic"
> meta/lib/oeqa/selftest/cases/uki.py:IMAGE_FSTYPES:pn-core-image-base:append =
> " wic"
> meta/lib/oeqa/selftest/cases/wic.py:IMAGE_FSTYPES:pn-core-image-base:append =
> " wic"
> meta/lib/oeqa/selftest/cases/wic.py:IMAGE_FSTYPES:pn-core-image-base:append =
> " wic"
> meta/lib/oeqa/selftest/cases/wic.py:IMAGE_FSTYPES:pn-core-image-base:append =
> " wic"
> meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb:do_configure:linux-gnux32:prepend()
> {
> meta/recipes-connectivity/avahi/avahi_0.8.bb:RRECOMMENDS:avahi-daemon:append:libc-glibc
> = " avahi-libnss-mdns"
> meta/recipes-core/images/build-appliance-image_15.0.0.bb:IMAGE_CMD:ext4:append
> () {
> meta/recipes-core/packagegroups/packagegroup-base.bb:RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc
> = "\
> meta/recipes-core/packagegroups/packagegroup-self-hosted.bb:RDEPENDS:packagegroup-self-hosted-sdk:append:mingw32
> = "\
> meta/recipes-core/packagegroups/packagegroup-self-hosted.bb:RDEPENDS:packagegroup-self-hosted-sdk:append:libc-glibc
> = "\
> meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch:+
> llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
> meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch:
> llvm::sys::path::append(Path, "lib", getOSLibName());
> meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch:
> llvm::sys::path::append(DriverIncludeDir, "..", "include");
> meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch:
> llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_BASENAME, "clang",
> meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdb:append:linux = "
> glibc-thread-db "
> meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdb:append:linux-gnueabi
> = " glibc-thread-db "
> meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdbserver:append:linux =
> " glibc-thread-db "
> meta/recipes-devtools/gdb/gdb-common.inc:RRECOMMENDS:gdbserver:append:linux-gnueabi
> = " glibc-thread-db "
> meta/recipes-devtools/python/python3_3.13.5.bb:RDEPENDS:libpython3:append:libc-glibc
> = " libgcc"
> meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:DEPENDS:qemux86:append
> = " nasm-native"
>
>
> IMAGE_CMD:ext4 isn't a "real" override per-se, same as for the RRECOMMENDS,
> RDEPENDS.
>
> The latter may be incorrect though as DEPENDS:qemux86:append would override
> anything in "vanilla"/"default" DEPENDS by using DEPENDS:qemux86 instead
> (which may not exist but will be created by DEPENDS:qemux86:append eventually)
> and then append nasm-native to it.
>
> I assume it's likely we need
>
> DEPENDS:qemux86 = "nasm-native"
>
> if that's the only required dependency for qemux86
>
> or
>
> DEPENDS:append:qemux86 = " nasm-native"
>
> if we want to add the nasm-native dependency only for qemux86.
>
> IMAGE_FSTYPES:pn-core-image-minimal:append = " wic"
>
> might be wrong as well as I would expect IMAGE_FSTYPES:pn-core-image-minimal
> to never be set, so this essentially just replaces whatever IMAGE_FSTYPES
> there exists when building core-image-minimal. I believe
> :append:pn-core-image-minimal may be more appropriate there.
>
> Similarly, I'm assuming do_configure:linux-gnux32:prepend() in
> meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb should either be
>
> do_configure:linux-gnux32()
>
> to entirely replace do_configure (as it is what it's doing today), or
>
> do_configure:prepend:linux-gnux32()
>
> to add this content before do_configure when building for linux-gnux32
>
> Cheers,
> Quentin
>
--8323329-639659414-1752600353=:1943712--

