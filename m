Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.13551.1605225915795203262
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 16:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=r2+BTxno;
 spf=pass (domain: linaro.org, ip: 209.85.219.170, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f170.google.com with SMTP id i186so7056798ybc.11
        for <docs@lists.yoctoproject.org>; Thu, 12 Nov 2020 16:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kGa7H9Tgfom0TRF/A7aJIGz5kry4Rj1pUwGj5gFXZGo=;
        b=r2+BTxnoDsk2Exx/7uq26xeyoW4MSq8fMSR/9CEeL2ZS0CtM0Yg9TvGEQq/62Y9jxB
         8/7GqVHQulDWslszw3LCO+bcmk8Ncflsi4oQFhI3l+jUlPzj5XiBQQjPn7fYdhXj+OHb
         5MHktwAMjCN1ef698+mEZJMWkKd0dLfo02Fy05oe9gDTULMLBx3/7hk/zkN/+KGtsYDl
         w7+qqKUOKXeHHhNLHjj67YYNSiJrddPzb/vTNR9OohmrFy3TdF8M+ph2+NYocWKQRHnb
         W1C2VclpE/8gSWx5gP60XhnpM6/3ZXgQE9+hXvLHXfqxkzEVjvDvYDHt2kSpDjUTcsdQ
         ZvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kGa7H9Tgfom0TRF/A7aJIGz5kry4Rj1pUwGj5gFXZGo=;
        b=D5IXAc6QXjOcIje6HVTJxxT8RTcvbhYM+vW17SbX5L3nh9lZ0aD6zekpCi75At4cEL
         N2HJqAyFDh7webF+ZMo2LctKok6ffaXHn6vyXHAB67YWja2uw4OufhYO9WC8PqGhGWro
         dCS5an+DD8WmNTo937lJxKevIg2Dersnex9IkunKk3yc4mgz1H4dgPD4B6M/5wtw+Win
         Xr44zZt9YwK3GKEBg36LBqmjaRFBAZA56aSo5tgtCM8oHlwvN1pQZlD76FT7L5xhBnhM
         biN+pLW8DnMsXPV1NovFJXaZ7zIJkClvyw5kUDNp5r2Cl+f/qdlVeZBfQkL62m3A/3wB
         fAWw==
X-Gm-Message-State: AOAM532W5fyos8ueC0MVlBd9AK2mt7Qzlt4vEkG756sVPsumGmXUzKvN
	y4rRXkuNysmuU7x3XvfwEcNEr4o0Wiizp3zPBS4KYw==
X-Google-Smtp-Source: ABdhPJyFB4wR7Df9SJqGTrqqiFLErGhSGbyJ/Jb2mZq9FR/Jlv7gZJAo1/v2WjUmBvfATN6egBCS/CsCzDIqORr+j34=
X-Received: by 2002:a25:287:: with SMTP id 129mr2551683ybc.454.1605225914767;
 Thu, 12 Nov 2020 16:05:14 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
 <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
 <CAP71WjwF8V7EJs=QnJzGW3iLBs2h7-zBwuvnn-TM+tiez8Or+A@mail.gmail.com> <CAOSpxdZd7YPi=8oZbTqL=ZUg8dOfbjRChBxvdEdrpd5mL_PwUA@mail.gmail.com>
In-Reply-To: <CAOSpxdZd7YPi=8oZbTqL=ZUg8dOfbjRChBxvdEdrpd5mL_PwUA@mail.gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 13 Nov 2020 01:05:03 +0100
Message-ID: <CAP71WjyO8o4aTc8ip2Tda3VueFhS=K82W_OQ7CaG2juk7kNn8w@mail.gmail.com>
Subject: Re: Sphinx for Dunfell
To: Steve Sakoman <steve@sakoman.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 12:55 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> I'm definitely ok with it!

thanks for the quick response!

>
> I'm getting ready to do a dunfell release sometime in the next two to three weeks, so perhaps we should make the switch immediately afterwards. Unless you'd like to live dangerously and try to get it out now :-)

Well, the yocto-docs backport is a bit more work. since we have
started to accumulate more patches than bitbake on master, and
filtering the one we need to backport is more difficult. Also, you
added some new docbook changes in dunfell (for each release) which
need to be converted to sphinx.. so the more we wait, the more work
there is! since it's just a documentation change, perhaps it can go
into the next release, assuming the changes are ready for review
soon'ish?

>
> Steve
>
> On Thu, Nov 12, 2020, 1:45 PM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>
>> Steve, Richard, Quentin,
>>
>> On Tue, Oct 13, 2020 at 9:41 AM Nicolas Dechesne
>> <nicolas.dechesne@linaro.org> wrote:
>> >
>> > hey,
>> >
>> > Doing the same exercise for the bitbake manual, here are the '/doc/'
>> > commits in 3.1 vs 3.2
>> >
>> > git log --oneline b94dec477a8d48ebceec91952ba290798c56c1f5..origin/1.46 -- doc/
>> > ====
>> > 324aaa7f bitbake-user-manual-metadata.xml: fix a minor error
>> > f92e19a3 doc: More explanation to tasks that recursively depend on themselves
>> > e4695176 doc: Clarify how task dependencies relate to RDEPENDS
>> > 25c5c79b user manual: properly tag content as <replaceable>
>> > be367887 docs: delete reference to obsolete recipe-depends.dot
>> >
>> > git log --oneline
>> > b94dec477a8d48ebceec91952ba290798c56c1f5..origin/master -- doc/
>> > ====
>> > a7c47f1e sphinx: rename Makefile.sphinx
>> > 427721d8 sphinx: remove DocBook files
>> > d52190ea docs: static: theme_overrides.css: fix responsive design on
>> > <640px screens
>> > 9ae5cce7 docs: sphinx: report errors when dependencies are not met
>> > ec4c481a docs: update README file after migrationg to Sphinx
>> > c87cc35a docs: sphinx: replace special quotes with double quotes
>> > ebdeef2c docs: ref-variables: add links to terms in glossary
>> > 29081375 bitbake-user-manual: fix bad links
>> > a0f37789 sphinx: theme_override: Use bold for emphasis text
>> > cbc5ca48 sphinx: theme_override: properly set font for verbatim text
>> > 08b1ae23 sphinx: remove leading '/'
>> > 99ba6fe9 sphinx: update style for important, caution and warnings
>> > d99760cc sphinx: last manual round of fixes/improvements
>> > 4f94633a sphinx: bitbake-user-manual: insert additional blank line after title
>> > 63adcaa5 sphinx: add releases page
>> > 3e940d93 sphinx: conf: enable extlinks extension
>> > 9921c652 sphinx: index: move the boilerplate at the end of the page
>> > 4e461224 sphinx: add SPDX headers
>> > cb19159c sphinx: Enhance the sphinx experience/nagivation with:
>> > 10a54678 sphinx: tweak html output a bit
>> > 219b2348 sphinx: Makefile.sphinx: add clean and publish targets
>> > 35fdc185 sphinx: fixes all remaining warnings
>> > e11d2dd1 sphinx: fix links inside notes
>> > 57300955 sphinx: fixup for links
>> > fa304c01 sphinx: override theme CSS
>> > 29af1cd2 sphinx: switch to readthedocs theme
>> > e8359fd8 sphinx: bitbake-user-manual: use builtin sphinx glossary
>> > 6bf6c8d6 sphinx: initial sphinx support
>> > 84ccba0f sphinx: add initial build infrastructure
>> > 44b57216 bitbake-user-manual: update perforce fetcher docs
>> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
>> > 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
>> > 06b5cf0a bitbake-user-manual-metadata.xml: fix a minor error
>> > c92a266c doc: More explanation to tasks that recursively depend on themselves
>> > caf42243 doc: Clarify how task dependencies relate to RDEPENDS
>> > 647c13d4 user manual: properly tag content as <replaceable>
>> > 2effbb6e docs: delete reference to obsolete recipe-depends.dot
>> >
>> > which indicates the following commits exist in 3.2 and not in 3.1
>> > (again, I am filtering out sphinx changes):
>> >
>> > 44b57216 bitbake-user-manual: update perforce fetcher docs
>> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
>> > 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST example
>> >
>> > Out of these three changes, I think only:
>> > 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
>> >
>> > Should be backported to 1.46 branch since it applies to 3.1, the other
>> > 2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I
>> > could import the Sphinx files from master branch, and 'undo' these 2
>> > commits.
>>
>> I finally came back to this dunfell backport.. I've done it, at least
>> for bitbake, since it was easier. If you are ok with the approach, i
>> will do it for yocto-docs as well.
>>
>> I pushed a branch with 3 patches to bring sphinx into bitbake 1.46
>> branch, it's here:
>> https://git.openembedded.org/bitbake/log/?h=sphinx
>>
>> This branch has the following commits:
>>
>> Nicolas Dechesne (3):
>>       sphinx: import sphinx docs
>>       sphinx: undo (bitbake-user-manual: Remove TERM from
>> BB_HASHBASE_WHITELIST example)
>>       sphinx: partial undo (bitbake-user-manual: update perforce fetcher docs)
>>
>> I can't really send this branch as inline patches, since the first
>> patch is huge (it contains the whole Sphinx files and the removal of
>> docbook..).
>> we could potentially squash them all, but I thought it was better to
>> better keep track of the thought process..
>>
>> Consider this as RFC. If you are ok with it, i will prepare a similar
>> branch for yocto-docs, and then we can merge both branches
>> simultaneously. It will impact the next dunfell release obviously.. so
>> we should plan accordingly.
>>
>> >
>> > cheers
>> > nico
>> >
>> > On Mon, Oct 12, 2020 at 2:35 PM Nicolas Dechesne
>> > <nicolas.dechesne@linaro.org> wrote:
>> > >
>> > > hi!
>> > >
>> > > The dunfell vs gatesgarth documentation are very similar (at least for
>> > > yocto-docs, I haven't checked bitbake docs yet). I believe the right
>> > > thing to do is to backport the whole Sphinx documentation into dunfell
>> > > for the 3.1 next release. The net benefit is that it will be much
>> > > easier to backport from gatesgarth and next branches into the current
>> > > LTS, which we intend to support for quite a while.
>> > >
>> > > Here are the "relevant" commits in yocto-docs in each branch so far.
>> > > Note that I have removed all commits about SPDX headers since we want
>> > > these patches for sure, all non related commits (such as a few
>> > > .gitignore changes) and the test manual since it's new in 3.2.
>> > >
>> > > So what remains is:
>> > >
>> > > Dunfell
>> > > -------
>> > > 1a69e2c02 Documenation: Prepared for the 3.1.3 release
>> > > 17cc71a8f Documenation: Prepared for the 3.1.2 release
>> > > bd140f0f9 Documentation: Add 3.1.1 version updates missing from previous commit
>> > > 069c27574 Documenation: Prepared for the 3.1.1 release
>> > > 98687310b ref-manual: delete long-unused comments in variable glossary
>> > > 2deac02f2 ref-manual: Remove long-dead PACKAGE_GROUP variable
>> > > 7c4d45e50 ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
>> > > 5edeb02f5 ref-manual: IMAGE_TYPES, add tar.zst, delete elf
>> > > e3a746396 ref-manual: fix excessive command indentation
>> > >
>> > > Master
>> > > -------
>> > > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
>> > > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
>> > > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
>> > > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
>> > > bootimg-efi
>> > > 08e25f2b2 ref-system-requirements: update supported hosts lists
>> > > afc290e85 virtual/libgbm is the provider of gbm.pc
>> > > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
>> > > for other distros
>> > > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
>> > > mesa-dri-devel
>> > > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
>> > > recent changes
>> > > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
>> > > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
>> > > afec5770a ref-manual: delete long-unused comments in variable glossary
>> > > 8e5469aad ref-manual: Remove long-dead PACKAGE_GROUP variable
>> > > d694ff63f ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
>> > > 7706a240d ref-manual: IMAGE_TYPES, add tar.zst, delete elf
>> > > a95b49eef ref-manual: fix excessive command indentation
>> > >
>> > > Which clearly indicates that the list of differences in yocto-docs
>> > > between 3.1 and 3.2 is down to:
>> > >
>> > > cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
>> > > 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
>> > > 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
>> > > 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
>> > > bootimg-efi
>> > > 08e25f2b2 ref-system-requirements: update supported hosts lists
>> > > afc290e85 virtual/libgbm is the provider of gbm.pc
>> > > e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
>> > > for other distros
>> > > 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
>> > > mesa-dri-devel
>> > > 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
>> > > recent changes
>> > > c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
>> > > a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check
>> > >
>> > > I believe many (if not all??) of these patches are candidates for
>> > > dunfell. If that was the case that would make the migration to sphinx
>> > > into dunfell straight-forward..
>> > >
>> > > Otherwise, what I can propose is to 'import' the sphinx files from the
>> > > current master branch and 'undo' what's not needed for dunfell.
>> > >
>> > > Steve, Richard: can you have a quick look at the list of patches
>> > > above, and tell us which one should *not* be merged in dunfell?
>> > >
>> > > Note: I have a sphinx/dunfell branch already with an initial 'import'
>> > > and a few changes like each history.rst file.
>> > >
>> > > thanks
>> > > nico
