Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40B6E99069
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152849.1775814498584963913
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VM4xwxLC;
 spf=pass (domain: cherry.de, ip: 52.101.69.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDA7dmtZ+IwsPZTLl4M6ky1cB+FsKy3HQS0L7WfYKsRCdZPfMX9mwUP5/dF8efVBRccSjZdpNYK0ZqHzcGwSXR9KxqSfZ193/a5oqZO7/pWaegmbBkWUkIJ0M4+P3Dt6QC70FpN980WRJXA7Fjmg7zwWJ+0UgT/jCg5hXEhUASKjN6bQtBuYSLyow45/mn1n5c+1bqShrP1q556Qyce6UxVP3e0BEqULfhn8vPKoj2tRcQ2VPrPLWl8MMP9SdPRZTUocSulRyVR8rGzWJ55Ss34Xn+ZHwJtnk6QuKgwIVotARCuYisLS6/Cy1NFrx0apPN5hdyZ8REhHc63qk63QJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNtNy6FTMGGpEP+b6DF3Bf4Vnwx63P9v4uRcdBrLR0s=;
 b=Fy8ul8peRm0OS6rxW8UfPsNh1UTFpa/Iu4tmyZ4xdKNbkuZUceRYv2qPlmlUxoCpb8nSa4j8UwQ+7iIsc2wGE5gBoBeOrJ5KM7cCM0a2eHt8QXOFsCtLVP3bxMSXikUCV1DMHe4SBVlqcqG5b3B5lYxo3MQnsKPb0aJtmvgSZ20rA2BhvQ1AO69BMu5SMSga4o3BhNtrQcna/dS4/vHbe+ASz3tKSK1hYk8LxTLHxzZcEsybJEKwSOPIVAoueqY1H9dw/fLyN+nauisE3wODPk6rTIvsptVNDxbOfPyAKWvFaiDvNRjkmXf9z1SmtxfiPyu650b/W8vOJj90b8bESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNtNy6FTMGGpEP+b6DF3Bf4Vnwx63P9v4uRcdBrLR0s=;
 b=VM4xwxLCABKQPCiRjX492/x/jSGcwUdfv/fmkp/oTulCFks9suiM1Q8AZCeP+T2VZZymLn3360EkCRFuhgH+9gknTBTyqqJukjfE1MvntKaJTPALtQ7cHve7gzNtCdEX7+YFkLYO653L0+uT6hsxpEGRdklNHXTWgXOmT6pbKmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV4PR04MB11896.eurprd04.prod.outlook.com (2603:10a6:150:2ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 09:48:14 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Fri, 10 Apr 2026
 09:48:14 +0000
Message-ID: <060888d0-0274-4876-82e9-bb2a071d338e@cherry.de>
Date: Fri, 10 Apr 2026 11:48:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] docs: ubuntu_essential.sh: explicitly add
 libcrypt-dev
To: martin.jansa@gmail.com, docs@lists.yoctoproject.org
References: <20260410093916.3788848-1-martin.jansa@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260410093916.3788848-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:802:2::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV4PR04MB11896:EE_
X-MS-Office365-Filtering-Correlation-Id: ca621787-26d6-4c03-30f1-08de96e64874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	aPircHOFSCbXwtecLJ7gcN36oanfWskKBjdKz1nkGsRaHXWd10I8UJ2LMPMHnMprtbsu5TpMMYuX2p6dz3sJUzA+KW4WqRRRXz4m/ejVBMcC44XGRG7Ro+Ji2F3V9+kniCnObiHxVWuGgVSZS78+Oq/tNP9KtJW6/TRCPb6DvR+OqpDFOSPVWW6YB5hqsQd3d369r5uGXePuACztvw+LFdTPmxWepGobpN7YNqFQULoyEP9AchE4kiRjfD1bLxcnIowr9aUkLCHMOUFtZEZXx/sV9ssA2GXd4INSSE7AydDgNF1ENQzg+F7+R4xhYWar6EooKH1zjRG1eAtQy01l+/mknrsUPDRd+f4vFD6ARVfE/NKd4/tlZnOLxaqIm2e+v30vsnss0cqGHMZJLnVVZePM0vcYBou2WIFx7Cr6237j8A5bUjrgo4yg7xEpAa5Li5Bw0V+/805VrLT8YXO1a3RjCOxhM0UP41q35IzfrP95CzQeRSC1Ws9LhJH+EdLsP/nt/QHec5W1JoztU2VT+jN61Jlb5pHRllr/NFYC3xe8UpTBIRAW4mLNhld/OFgSP5E8QKOYvujBG/8opTEDDyfj9PWKIHXnrMhmyobgQE8JpfD/nPSqGXCScR0H+/L03oj1VGrhtobUn9D8lTMi/P222wcd/9Kw+203wWhcRgDWC0CdQ+b88ThOe8Is3/7ck9KH4XbwRC74mg6rULRtBjsdkhNs2XK+SxtQvWfKyl8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDg2WlZONm4zL253OSt2ZlQ4WitjN1lNVjZ5aU9sK3RtWmduakMvUUVGZUdS?=
 =?utf-8?B?Smo0Z3FVTmZKbVVtUlFzdXp3UERrT0VTaVBIQnNyS3pvQS95VWxLL0xFU0hm?=
 =?utf-8?B?MVVGWGhWaFI1SGg4YXRxaThyOStsemtuMmd2MVNlRFllSklmRVNkY1RIeFZV?=
 =?utf-8?B?RDBEK2xrSW40VkN3d3hSQTQwdXBxeEFQU1VRQ1RsN0Q1MGRhZTZGTTVHU0x2?=
 =?utf-8?B?TzRBU1pvTmdLZDhuampybkc3WVhDYnk0UlZUcjliKzArK2ZINUpEc3Y0OHBL?=
 =?utf-8?B?R0RLUG5nYWk4ZFAxMGEwT09UVzVvMGpkVEM0UDZ0ODd5UjlTRkZtT3Bpa3Z5?=
 =?utf-8?B?eDNNZTRRZkFLS2NQTmZRdkE0SHNaVUlSd2tKamN6NkdRVlF3WG1hWElyejVT?=
 =?utf-8?B?SkNzWnIwT2x3aFUzRDlOUEc2WkcxY29sNWVtVnkraUhUMnNWRWR6R2lpTmZ4?=
 =?utf-8?B?MHNEZGlHSFVXL1QxQzQ4WlRiR2V6amxuck5ydFE2VUxmM0tteXRHYjcxZW4w?=
 =?utf-8?B?azN6UTJNRHd0SVlqQ1Z0ODBRdHZqbkhjZ1VjWC93b0tXREZlajVqeFZxcDBn?=
 =?utf-8?B?MG1TNTlGTlNudmtTRFZsNnF4L2E1cWEyNWxid21GYVc5RXZPU0g5QzFabU9h?=
 =?utf-8?B?cjVGekhMZFArTlRscndScHd3MDBTTm1kWE1tK1ZqN0pwVEpCOGNIWHJzS2d5?=
 =?utf-8?B?VVhoNlpLbFp0Y0k4K3pta2tiUlhFUnNGZDVXN1ZiTEdScEFyK200K1VnU2t1?=
 =?utf-8?B?SnE2a0xtRVVza2dzUHlyMCtzdlVSbjhBbDc3N1VVaC9QMlV0WDY0ZHlGMTJ3?=
 =?utf-8?B?S2oyajNqaUdHQzFPbFg1Q1JtbjM3NzYxTEt4aHNMZDg1ZGpsVWtJZFU4ZWdj?=
 =?utf-8?B?ZUpuamhkUndWM1l5VW1NdnNYTTJGNzc2bEgwM3BBTGtUSnJMNHBjQTBxWW1p?=
 =?utf-8?B?ZVVGM0c2VXlWby9NcndjVnR2QU16dGw1Y2xlMENjaUNtZUo1dm5pNTM1RnZo?=
 =?utf-8?B?SG1DS3lQejdrY3RQVVNtVU1veTR0eTFMRzVrMld5bXBEblhHQzdhdzZySmhq?=
 =?utf-8?B?MlAwc01FdWhnaTJZTXZZQVNSTVV2SmdQeHJkbE9yV0t1K3d4Y3pSUUJORnV4?=
 =?utf-8?B?UEp6R2tmbTZDTWlKQUNxOGZ2V0htV3dZS3VEbEVKbmNzSnJTaFdXZ0NzS0Zr?=
 =?utf-8?B?WHc2VDdyRFV4ZTduMnNFVWJKMWM2SW5JVGhnVUdjMmo4SjNYWmdQK0ZKcVo3?=
 =?utf-8?B?aHF5dUVDS1EwS0F0NUtRNGdTK3RaVHIvRThSM2I5QWhuNFZaUWNTeFNRdjlW?=
 =?utf-8?B?V291NHc5YWhzaUVMUWFPZi9BU2Q2Qnc5c3JWTDFpdEF1MTZ1Ukg2VWJkL1U2?=
 =?utf-8?B?TTh1ZHZ6ZFNpaE1SUEVucG1Gdk9DT0Z6dmh6UnViMmQ1OUpVNE1ZaUthSkRp?=
 =?utf-8?B?ZXZ2Y3MzTU8rSjhyN2pxSnhKU2xwQWk0eEJGUDBOUWprL015S3E2ZHR0aFlT?=
 =?utf-8?B?M3c5S25tOVhCNXdTbktkNmpaNlNRYjJRSEJJZEdjbTNqcytjVnB5eFdRTXJt?=
 =?utf-8?B?SjloYVlJZWZpVVRtN0RHTjBJaUhuU2daaE9RRGRaZnFKZVc1SndhTlBVYzNh?=
 =?utf-8?B?aU1JYVZ2U2tXaWhBcmJHaWt5cTJxQldrTGlKVWx5S01YckdLMzZqMnQ0WHZp?=
 =?utf-8?B?Vkp1aUVEMXFUYXFzY29WekdFSXVSRE8ySHQ1QmtiWXVXZHBYL3l2M2xvbGNj?=
 =?utf-8?B?dUpEMU11c2N5Mms4MFlkMDhzL1JIZ2JuVWh1UC9uVW8zd05ybWIwTHBrekRz?=
 =?utf-8?B?VFJWMGNMblhkUHdFTnNTMm9jb3pjZmxrUlVqdURUbksxUkg4eGt2RExidEcr?=
 =?utf-8?B?YUtIbUdVUmUyOWR3M0dNYkRSTC9hSUQ3MDZvYS9zcHRFS2t0bDlIaUI0SGkv?=
 =?utf-8?B?SzBtWGIrWmpmT1lXdG1lenpweWUrZUoza29MbHFiWnZlNmpkZzFNa2hDd2xM?=
 =?utf-8?B?WGpEcU94UnJVNm1BczRYbk9sZEgyeFYxeVJGM21nMFBMQTVUdmhlUjZGWnVR?=
 =?utf-8?B?UzRycXhLcXdiQmNKdmdWWUR3dEowTzdIa2RyU05RQzBhb1h0V1BkUGtOQWRi?=
 =?utf-8?B?SkxLOW1KWmRpN3BQTHg3cnhUOStjenRqNXlmcTBMdW9PZ2Y1OUcyaW13Z1Zj?=
 =?utf-8?B?cTQzZWZhdVZOVjR6R0dZUnVhL1M5UVNYZWFndVNvRTdDb3NuZUtpTTlHdzNG?=
 =?utf-8?B?OFQxNmRBbVJVc0lKeE51WGk3Ylh6SWQyQ2hHWUxGaG5EbHJYem5RZWlqRGJE?=
 =?utf-8?B?RUF1dWlSdTJmeWJwNHYyQlE2dGVDeU56a0FZUE9mdC9SL243WXFZY1VsTjk2?=
 =?utf-8?Q?DwOITpntxkAKIPvrLI00ZXara5zm2uv/sU8Ho?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ca621787-26d6-4c03-30f1-08de96e64874
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:48:13.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0TW3q94lGW8RPxXgCoWyb3DH6Ex6a3r0noOGFKLcSDAnRri0yb2dXu+8KrCxWXMPwNUS1rckxnuvU0YcGqUnKIpQgTzePs7Sx1VVLu8ep4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11896
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9220

Hi Martin,

On 4/10/26 11:39 AM, Martin Jansa via lists.yoctoproject.org wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> In latest ubuntu-26.04 build-essential no longer installs libcrypt-dev
> But virtual/crypt-native is in ASSUME_PROVIDED and is expected to be
> usable for development.
> 
> It used to be installed as build-essential -> libc6-dev -> libcrypt-dev,b
> ut not anymore since 2.42-7:
> 
> 25.10 questing with 2.42-0ubuntu3.1:
> https://packages.ubuntu.com/questing/libc6-dev

Broken link.

> 26.04 resolute with 2.43-2ubuntu1:
> https://packages.ubuntu.com/resolute/libc6-dev
> 
> https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2ubuntu1/changelog:
> ...
> glibc (2.42-7) unstable; urgency=medium
> 
>    [ Aurelien Jarno ]
>    * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt-dev
>      dependency from libc6-dev. Thanks to Helmut Grohne for proposing that,
>      doing an archive rebuild and filling the bug reports.
>    * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap static
>      probes.
>    * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the removal of
>      the obsolete termio interface.  Closes: #1124068.
>    * debian/rules.d/debhelper.mk: ensure that linker scripts work even when
>      /usr is unmerged.  Closes: #1120508
>    * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
>      source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
>      unpack-message-for-{orig,source} overrides, fixed in lintian 2.128.0.
>    * debian/control.in/main: drop Rules-Requires-Root: no, this is now the
>      default.
>    * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: remove
>      the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
>    * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed wrt
>      GLIBC_ABI_GNU_TLS.
> 
>   -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +0100
> ...
> 
> Without libcrypt-dev installed on host building shadow-native will
> fail with:
>    checking for crypt in -lcrypt... no
>    configure: error: crypt() not found
> and python3-native with:
>    The necessary bits to build these optional modules were not found:
>    _crypt
>    To find the necessary bits, look in configure.ac and config.log.
> 

Note that we share the Ubuntu instructions with Debian (and for many 
different versions).

On pkgs.org, libcrypt-dev exists for Debian Bullseye, Bookworm and Trixie.
I manually installed the package on 22.04, 24.04, 25.04 and 25.10 and 
they all exist.

So:

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

