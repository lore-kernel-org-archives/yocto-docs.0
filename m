Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.39487.1602506138704798983
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 05:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XG7MUB7e;
 spf=pass (domain: linaro.org, ip: 209.85.219.176, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f176.google.com with SMTP id a2so13312082ybj.2
        for <docs@lists.yoctoproject.org>; Mon, 12 Oct 2020 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=2sy18iykXsQvjIBqJYmaKe+TgOY09KsiT5cKmL3soOo=;
        b=XG7MUB7ea2Boknf7Wl8+HhdKio9Xzgq7dGD8Hz/j5x2mgOzYapv2U4uVokn5L41pq/
         MIheyUL9PXqs/RtFcfSUcdBKvkGZuOvFm7QXzobTt8yzLJ03G3ISkh2/ghciIg3TmWMn
         b/lYlrFT9cnHscyvxrdRfCHraIbsdo/tW6iM6ccUYEjPNl/eQ5RxUhahyHw3MeWhf1uo
         GrwwUIJ7ltX28g3yYM1PhIOVnEYhyfDpqgknEUcWbLzabBo8QsJ6B2QmHwWehwKFRh0r
         SrQAtyTfsji2i/W3oIyMqdrcI8hyC/MgGr3JfHlgjyANeE/1hiL7XrCmJaybMzDFiVp2
         /jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2sy18iykXsQvjIBqJYmaKe+TgOY09KsiT5cKmL3soOo=;
        b=WS0zfqMoHwtggiBWazzCUzep/OqQtqk9+cYSZ+ASt+nsF3fJO+c3onJZLEkfubPr0X
         UVQvOXq5olXAld3gdVCUj6ihGw1cUjXipTE8kddZkH5jRQza+8BdIePwe2kDsjlhiW6K
         xc/QRuaVDjMyN433AvQNEAAbDGPVPXkltxHtgf0XQt95rUNUKurKNEtW/qM1utXAmAVO
         q7OyQZALbj4RYW1QmG8/Ts6pCOsl286h8Vzek2k03385DATnvF34AJl8XY1Q0kuVZibG
         XY6DLlGm8Dp5+XCfWWjnzBduRj+AOxTt2pxNgWSz98AGfws3GmHWc0NdSIynVJk4VgTH
         tLhQ==
X-Gm-Message-State: AOAM531aOYNyS9cmmC61rMF5WGViSlwi/i6w9HJhH5ddMZBkswOMXiUo
	E+4UiiJg9xhC76u688iE6Rwk6Zq3vMpgvxQypoVmPgxXwP5QKbUq
X-Google-Smtp-Source: ABdhPJxJYXpBHVNkizmfE4VdtiH6LSzt3ptumyD9W4Cj/sKikv7hrV9qkO9e7Od25IIm50A7s8Yfow9sP0BCeQtQ76M=
X-Received: by 2002:a25:e43:: with SMTP id 64mr20623696ybo.371.1602506137492;
 Mon, 12 Oct 2020 05:35:37 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 12 Oct 2020 14:35:26 +0200
Message-ID: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
Subject: Sphinx for Dunfell
To: docs@lists.yoctoproject.org, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"

hi!

The dunfell vs gatesgarth documentation are very similar (at least for
yocto-docs, I haven't checked bitbake docs yet). I believe the right
thing to do is to backport the whole Sphinx documentation into dunfell
for the 3.1 next release. The net benefit is that it will be much
easier to backport from gatesgarth and next branches into the current
LTS, which we intend to support for quite a while.

Here are the "relevant" commits in yocto-docs in each branch so far.
Note that I have removed all commits about SPDX headers since we want
these patches for sure, all non related commits (such as a few
.gitignore changes) and the test manual since it's new in 3.2.

So what remains is:

Dunfell
-------
1a69e2c02 Documenation: Prepared for the 3.1.3 release
17cc71a8f Documenation: Prepared for the 3.1.2 release
bd140f0f9 Documentation: Add 3.1.1 version updates missing from previous commit
069c27574 Documenation: Prepared for the 3.1.1 release
98687310b ref-manual: delete long-unused comments in variable glossary
2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable
7c4d45e50 ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf
e3a746396 ref-manual: fix excessive command indentation

Master
-------
cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
3aeca3b34 ref-manual: Add documentation for kernel-fitimage
41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
bootimg-efi
08e25f2b2 ref-system-requirements: update supported hosts lists
afc290e85 virtual/libgbm is the provider of gbm.pc
e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
for other distros
3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
mesa-dri-devel
7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
recent changes
c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
afec5770a ref-manual: delete long-unused comments in variable glossary
8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable
d694ff63f ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf
a95b49eef ref-manual: fix excessive command indentation

Which clearly indicates that the list of differences in yocto-docs
between 3.1 and 3.2 is down to:

cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
3aeca3b34 ref-manual: Add documentation for kernel-fitimage
41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
bootimg-efi
08e25f2b2 ref-system-requirements: update supported hosts lists
afc290e85 virtual/libgbm is the provider of gbm.pc
e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
for other distros
3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
mesa-dri-devel
7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
recent changes
c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check

I believe many (if not all??) of these patches are candidates for
dunfell. If that was the case that would make the migration to sphinx
into dunfell straight-forward..

Otherwise, what I can propose is to 'import' the sphinx files from the
current master branch and 'undo' what's not needed for dunfell.

Steve, Richard: can you have a quick look at the list of patches
above, and tell us which one should *not* be merged in dunfell?

Note: I have a sphinx/dunfell branch already with an initial 'import'
and a few changes like each history.rst file.

thanks
nico
