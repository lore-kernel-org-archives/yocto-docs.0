Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A73C64EC4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 07:03:25 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web10.3104.1677049397801338827
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 23:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [172.31.28.27] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 92F7C803179C0;
	Wed, 22 Feb 2023 16:03:15 +0900 (JST)
Message-ID: <26af555b-29d9-0aca-33e0-78c785f57ed5@lineo.co.jp>
Date: Wed, 22 Feb 2023 16:03:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [yocto] [ANNOUNCEMENT] Yocto Project 3.1.23 (dunfell-23.0.23) is
 Released
To: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
References: <DM5PR1101MB236154AB4E9325526DECC359B9AA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
Content-Language: en-US
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <DM5PR1101MB236154AB4E9325526DECC359B9AA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 07:03:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3709

Hi Lee

 > - ---------------
 >
 > Fixes
 >
 > - ---------------
 >
 > Fix missing leading whitespace with ':append'

populate_sdk_ext.bbclass : Fix missing leading whitespace with ':append'

https://git.yoctoproject.org/poky/commit/?h=dunfell&id=88cf58e2f50646b882dd2f46ba128191412a9637


On 2023/02/22 13:37, Lee Chee Yang wrote:
> Hi,
> 
> We are pleased to announce the Yocto Project 3.1.23 (dunfell-23.0.23) 
> Release is now available for download.
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/poky-dunfell-23.0.23.tar.bz2 <http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/poky-dunfell-23.0.23.tar.bz2>
> 
> http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/poky-dunfell-23.0.23.tar.bz2 <http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/poky-dunfell-23.0.23.tar.bz2>
> 
> A gpg signed version of these release notes is available at:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/RELEASENOTES <http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/RELEASENOTES>
> 
> Full Test Report:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/testreport.txt <http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/testreport.txt>
> 
> Thank you for everyone's contributions to this release.
> 
> Chee Yang Lee
> chee.yang.lee@intel.com <mailto:chee.yang.lee@intel.com>
> 
> Yocto Project Build and Release
> 
> 
> - --------------------------
> 
> yocto-3.1.23 Release Notes
> 
> - --------------------------
> 
> - --------------------------
> 
> Repositories/Downloads
> 
> - --------------------------
> 
> Repository Name: poky
> 
> Repository Location: https://git.yoctoproject.org/git/poky
> 
> Branch: dunfell
> 
> Tag: yocto-3.1.23
> 
> Git Revision: aec83663aadc871354b441eef0a3a41eb3780b13
> 
> Release Artefact: poky-dunfell-23.0.23
> 
> sha: 53dad656bc3dfedd1f58d6fe4b7771dc696b9cdab3aa108232d2a05f47d90dd5
> 
> Download Locations:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/poky-dunfell-23.0.23.tar.bz2
> 
> http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/poky-dunfell-23.0.23.tar.bz2
> 
> Repository Name: openembedded-core
> 
> Repository Location: https://git.openembedded.org/openembedded-core
> 
> Branch: dunfell
> 
> Tag: yocto-3.1.23
> 
> Git Revision: daaee6fcb0d201f041678af433d8e1cd6f924d09
> 
> Release Artefact: oecore-dunfell-23.0.23
> 
> sha: 98aabb01fd40eac4067074b0c6ac716b5811c73411e97996e677e3e3c8b2e34b
> 
> Download Locations:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/oecore-dunfell-23.0.23.tar.bz2
> 
> http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/oecore-dunfell-23.0.23.tar.bz2
> 
> Repository Name: meta-mingw
> 
> Repository Location: https://git.yoctoproject.org/git/meta-mingw
> 
> Branch: dunfell
> 
> Tag: yocto-3.1.23
> 
> Git Revision: 524de686205b5d6736661d4532f5f98fee8589b7
> 
> Release Artefact: meta-mingw-dunfell-23.0.23
> 
> sha: eccee0d65705857e07950c699263c28ec6eb17d5bbf228d6579e887fdce7a798
> 
> Download Locations:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/meta-mingw-dunfell-23.0.23.tar.bz2
> 
> http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/meta-mingw-dunfell-23.0.23.tar.bz2
> 
> Repository Name: meta-gplv2
> 
> Repository Location: https://git.yoctoproject.org/git/meta-gplv2
> 
> Branch: dunfell
> 
> Tag: yocto-3.1.23
> 
> Git Revision: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> 
> Release Artefact: meta-gplv2-dunfell-23.0.23
> 
> sha: 5613b655f022f0bcf8e15d72bacf9fd94ed80f24577095a0e9345829df463860
> 
> Download Locations:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/meta-gplv2-dunfell-23.0.23.tar.bz2
> 
> http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/meta-gplv2-dunfell-23.0.23.tar.bz2
> 
> Repository Name: bitbake
> 
> Repository Location: https://git.openembedded.org/bitbake
> 
> Branch: dunfell
> 
> Tag: yocto-3.1.23
> 
> Git Revision: c16d364dbf68d2a500fecaf8d6e6d62b11475d9f
> 
> Release Artefact: bitbake-dunfell-23.0.23
> 
> sha: eea9dceeadca1af583237243475139b6faa8449e6147c87beefafdefd59a8e00
> 
> Download Locations:
> 
> http://downloads.yoctoproject.org/releases/yocto/yocto-3.1.23/bitbake-dunfell-23.0.23.tar.bz2
> 
> http://mirrors.kernel.org/yocto/yocto/yocto-3.1.23/bitbake-dunfell-23.0.23.tar.bz2
> 
> Repository Name: yocto-docs
> 
> Repository Location: https://git.yoctoproject.org/git/yocto-docs
> 
> Branch: dunfell
> 
> Tag: yocto-3.1.23
> 
> Git Revision: 28f22e068aaf9598ac3426b35b6655102852590d
> 
> - ---------------
> 
> Known Issues
> 
> - ---------------
> 
> During testing of the release one well known qemuppc intermittent issue 
> was observed but did not recur when the test was repeated.
> 
> - ---------------
> 
> Security Fixes
> 
> - ---------------
> 
> libsdl2: Fix for CVE-2022-4743
> 
> go: Fix CVE-2022-1962
> 
> vim: Fix CVE-2023-0049 CVE-2023-0051 CVE-2023-0054 CVE-2023-0288
> 
> xserver-xorg: Fix CVE-2022-4283 CVE-2022-46340 CVE-2022-46341 
> CVE-2022-46342 CVE-2022-46343 CVE-2022-46344
> 
> ffmpeg: Fix CVE-2022-3109
> 
> - ---------------
> 
> Fixes
> 
> - ---------------
> 
> Fix missing leading whitespace with ':append'
> 
> bitbake: bb/utils: include SSL certificate paths in export_proxies
> 
> bitbake: bitbake: fetch/git: use shlex.quote() to support spaces in 
> SRC_URI url
> 
> bitbake: fetch2/git: Clarify the meaning of namespace
> 
> bitbake: fetch2/git: Prevent git fetcher from fetching gitlab repository 
> metadata
> 
> build-appliance-image: Update to dunfell head revision
> 
> cairo: fix CVE patches assigned wrong CVE number
> 
> cve-check: write the cve manifest to IMGDEPLOYDIR
> 
> cve-update-db-native: Allow to overrule the URL in a bbappend.
> 
> cve-update-db-native: add more logging when fetching
> 
> cve-update-db-native: avoid incomplete updates
> 
> cve-update-db-native: show IP on failure
> 
> devtool: Fix _copy_file() TypeError
> 
> devtool: fix devtool finish when gitmodules file is empty
> 
> documentation: update for 3.1.23
> 
> lib/oe/reproducible: Use git log without gpg signature
> 
> libtirpc: Check if file exists before operating on it
> 
> linux-firmware: upgrade to 20221214
> 
> linux-yocto/5.4: update to v5.4.230
> 
> lttng-modules: fix build with 5.4.229 kernel
> 
> lttng-modules: upgrade to 2.11.9
> 
> poky.conf: bump version for 3.1.23
> 
> python3: fix packaging of Windows distutils installer stubs
> 
> selftest/virgl: use pkg-config from the host
> 
> systemd: Consider PACKAGECONFIG in RRECOMMENDS
> 
> toolchain-scripts: compatibility with unbound variable protection
> 
> vim: upgrade to 9.0.1211
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#59273): https://lists.yoctoproject.org/g/yocto/message/59273
> Mute This Topic: https://lists.yoctoproject.org/mt/97153695/3617373
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [ito@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Takayasu Ito
Yocto Project Ambassador
Solution Department Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp


