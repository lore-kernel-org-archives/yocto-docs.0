Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1895C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:49:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4269.1790160561541926919
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 03:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Q4dtgDFJ;
 spf=pass (domain: cherry.de, ip: 52.101.70.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm3b0EKK0pew17pdho7Gf+OyWOVwKKnqaNKfOsvUIzaaB62OeIYi2dFW+LUer9ey6Sn6KVSUUa7PiirBrDJeIxQ4QXOXnW+ki3urmj7BVKXvBz0n/s8FGpRC2HP8+rU4N8kE6XOpErc4qDc0aklOtqf/WUlFqq3OtilagPYz1P4tlLbyTop3egbSNk8aL263u60gPSkNRs3qGXVFW8FoaL2EYJ4KtnKu50ln5a/Zb7GTrwqrTGSJ685/LF/3oVjDXN53T72zxLfXYf/ZothVhCRoKs5EdEXjjNtA71RAAAWt3/I3wykdnvRQ9181N2Aed78sUIepRtBYBNOgI67alg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmJ30kXvrZod5S63I6FPlIisxiO0tgf+LvpZM/eXAJk=;
 b=tvnS51L3I2GPTuzWmU9CdbSk9pA9jjC559CynNS6yM14lS1S1z8BVrO6Ex2WJu2Wk7U6XTvNevxZ+g3RtAcnx8v6EjbFG0lVvj++m2HTsnQ+jFM4VLdHxJaahVjFRoAxWo8i+41bbbJs8ojzH5odq+txaKyI7bRoVl/6/4ywJ9HmU/eQE7j+Is42PaipRRmN76mRys/ts/Gzv0kqolvW/NxjHTpqJFgQTWm9qhQgbSD4FCyUke7NxihVYeQHXi4jojQZTWBGQvdGN5dKHkMVrwH5qAdL0PYX9Kb8AV31tnBBMPSEXF6O23X3LgiE8QYaslCG2j+gpzLGtpoqzcck+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmJ30kXvrZod5S63I6FPlIisxiO0tgf+LvpZM/eXAJk=;
 b=Q4dtgDFJ0Bwc5QzV8mUW8btoju9tAsDo5si26KudtBSJyssE6k/rXGtdyUHjhM37q8AVaZwCzIv5SpBxcMBTfbcs9hL68VjbaDGt4cl0KV/GGLhmu1zmvAAjVMYZgmBAyXOEsGuou9qxEk/G+Y/qzgYD1l1ZdPxCXcWMksj9KkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB7926.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:49:13 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:49:13 +0000
Message-ID: <dcf71aea-ce33-42b2-b014-07bced443f76@cherry.de>
Date: Wed, 23 Sep 2026 12:49:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/8] docs: show a prompt on commands the reader
 is meant to type
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-4-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-4-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0036.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::18) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: a84fa674-f0f0-42f9-1e1e-08df19604e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|17096099006|11146099003|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	x2LoPFlzBsW76YoQzzdijtAAnlr2XJp0gBcpsadap6DDM4XP8Ok7jJmr+8YgnDPGbRQZRhKJSMTO+yb5cijZMUoelYG3RQHhf8uzZ3MK9P+/JJnSm2z/iP0zRonYD9TNeOna10/cWKEcHKbpYaMaxbz2BMK0pZZMxc8UXSjVr/vWR7WOJ9aCl3lz25CYDfxa1HxeL8wOT/pfD6ZOZMTSFlO7vUCsjoFGD/JRsGwRjQVwGyUSc2PAeilZe+BtdoUTmGxuYAx9z/Z7MQN9SFvSSxCus3urCkV4TU34S1HzcrfqdldYOC1iDvJSZGvDccqZpFrfT+d3LjsOwCEhvh3bMivZrVSAhu5MzA24J6wvxBhkM9T1qL5+BbBbmOV/z8WNIlQsCU6Tpw52/fElPANkh6zlESSCovYDeiN1TEEq9x+f4TLLQqBuEEVEmc1cm7KM+oBdtXZ6yx6dPVfwfouYQrDulkpDkuKouRNnSeeA3jfgquFApM/JxqPk78HvTOilmkv0UieF5rukj1q8FPa+1tMHHXHd3EA420PuqoEx5BynvITJLh26ZYz1KC6UtPgrJ9AKvG8zg3wokEW4nHppb0+NgdiqdYZltnq3Y/kcJTFOR3MPjij7kWpkttj9p4L/xpiLer9IApxoAkSepfrBP+ZA8yGlZXOg6DPHBeHRUHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(17096099006)(11146099003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlBxWFI1WlNhMjJsV2svdEU0NDZXdEpKdFZTZm1CbVFPUmJUY3pidjlTcnB2?=
 =?utf-8?B?MFhiTTdpRGFjNHY1dHhZdUUyYWlWaTROWjFRSDFsM1ZvdERad2EwTkZVcVQx?=
 =?utf-8?B?dTVFKzhkZys3ek5VbnhuQi9YLytRSk1WSUcvcUk0Yk1UeExlSXZjUUl0YWJo?=
 =?utf-8?B?MmsxL2VTVVZxV1BhUlRpN05MTElKRWcreDdWbFJqeXFnbTc4YXBFaHVSTUdE?=
 =?utf-8?B?ZVlMcW9rYVhxcXo5NldsL203VFRGcjZHVm9QSW9Zd2tveWlldTdHblUwOFV5?=
 =?utf-8?B?UnRLR3Q0SlBISlJXRmczU05XZ1VHWUdKRVI5VUZmNmVQdDJlczk5M1FPdEpF?=
 =?utf-8?B?ejNQZmVSWi9mc2V1ZGR5Q2FhYytWTjdSWHVrMVBqWjA2ZFRDNWVxS1pMYkpL?=
 =?utf-8?B?bmpwcW9FcXZZT2t6UnpzMVh2SHZNeTlLTyswYy9XRW0yV3EybllZelhkK2V1?=
 =?utf-8?B?aFhXN2FlSytVczBhTllPUUhQNWEyNWVQSWpPeURyRG9IUlVHejk2dzNJK1Jw?=
 =?utf-8?B?TXhCdU54V1k4ZUh4bW5rV0FCdXRZWFRUc0IvTW4vMkJ2aG9nWG16ZEx5UG5n?=
 =?utf-8?B?TFk1Zjh3ZzFnTlI0MDVBdXlvQ1dQOFlPTWRDOFZXc1ZOT1VLeEFiVmFYbThr?=
 =?utf-8?B?TEpZaUdhVTc3YTlpUWUvZFJVbzhqR1VNNGxpS0kyb2dsd3RmSGcrMHRRQWIx?=
 =?utf-8?B?UFRYVHc5a0JOUHd5Vkx3L1pHZVI5eHpMWUlzaE82ODhyVVdqODhxSWY0bitv?=
 =?utf-8?B?blJnemd4KzlNcHdFWW9FanFPeXh3MTFTQnlUUmlPMmg1OEM2TVNkR09ENTRj?=
 =?utf-8?B?a3R6MGNxSFY1TXJCL2hrSjJ0L1JmZjdZcUIzeFF0cjNxcE04N3k5WmUxZmJh?=
 =?utf-8?B?SFJBMHNpSFB5aDBha3NFOXI2Y20rd3NvWUE4L284NTdEUjl2b0hqU0tRdjB6?=
 =?utf-8?B?L2xPOFV5TTZ6SXR2ZUJPZHAwS1BkYmZ6NjBoVUltSG8xSzVkNWVXejFiNGMw?=
 =?utf-8?B?bkw3c3prOWVpcWNYSFFJbnpwZDd2NDA3TUVMOXJWbUh3YlJCeFVXcFdvYXEx?=
 =?utf-8?B?cEhPTUVxZVhmUHdvWSs1Q3BEQ0hLUEdTWjNLcVhmZGFKV0pwckVkd3NpOXkx?=
 =?utf-8?B?ZUJUTmd1QVloZWkwZVhsc0xnSXdmaXFSZ0pIbTVhQk9QbzhiZnFxa2NuVW0w?=
 =?utf-8?B?T2dmN1JMOFBjejFlTWdrNU1Fa3NLdTh6R21Gc09LUlBWeFFuTWEvOFpDNE1V?=
 =?utf-8?B?VEhuZE9rNEMvRTBEVkxNaVVweFRlUTkxNEwzNUVYY0lGaW40cmtPRi92SVFj?=
 =?utf-8?B?R2dHbEVxUFZBZzY1STRBakphTUtLV1VtVEV0cHQ4akh3eERDRTJOZDhoSzJF?=
 =?utf-8?B?Vnovd08yeGNXZ0luWmRmRVg5U0pkTTk4TldsZWp5ZGpxU2kxU3E1aStlYlJx?=
 =?utf-8?B?WTk1a2hPRjNOY09MM1d4bHFkZ2ZqZnh6OEVwcTdiTzVaNHBpZXRvMlZuc0Z6?=
 =?utf-8?B?T1k3M3NYNFFiT2VGamEyZm54VUt2OGVGNmlEalNJc1VOZEkvMlNTQlZWL2s0?=
 =?utf-8?B?WjZHM1c4K2Y5Z2J1S2VDbllZdDVoVDlkank3T1ZSVm5RWmQyeDZjdWpKbW14?=
 =?utf-8?B?MERoZ3BvekRrYVYyK0NRazRjNFU5a1cxQSs1TnNaN2NsVk1zK1NJT2dCYkFw?=
 =?utf-8?B?ZU1uQ2pNcEMrZmRjUFpod3RlNmhkbzFCTy9vb2VWcTd3TXNDUmdQekVVN2Ru?=
 =?utf-8?B?T3lScXltb3p2aHhYR3phV2cwZTRqSnc5VmphVlZycStCdmtidDIxMHIwTVVp?=
 =?utf-8?B?VFYzQ0x4b2RlcUZ2Mjg5SllWSXhKdDQrcjdqVHpoUzdWOE5zRWUrdUNYZUlB?=
 =?utf-8?B?V0x5cURaYmRRaWEyVnBEL0NISjcvc1B1UHlHYXU4SzJxTit2d1BQYjNlZ29K?=
 =?utf-8?B?NE9jWEp4dVBnaVBCWllDSGRzMHJrRC80NHN5NCtWZFhwcTduM0F0MWQ5NHFk?=
 =?utf-8?B?U0RJNmFHd3RmRU9aQzVMTUpMYktwYVZId1FRQko2WHZPMW8wS0pkckh4a3Fk?=
 =?utf-8?B?b2xqM1J1RTFkMXdaRUp5a1ZkRUkxT0tpckNucTNGK1VDYm8xeUFJQ1lGM2Nt?=
 =?utf-8?B?M0p2RWFmbjRwQlhqZkhoNXRTK2N5K1VJUEVHa1NoQVl5amFhUzlWSlZDMUxZ?=
 =?utf-8?B?Mi9Yc3JZRlpSWWtxdEdjaCtDMEcrMk53L3JObHN2UExCWVlneHduaVQwUWdu?=
 =?utf-8?B?TGg4anhORUR2U21zOTFSZEFDMEV5cDNvS2J5dmdydkFBcmJXMWtzOVBYSVpi?=
 =?utf-8?B?cmVuVUZrVUV0dDNjaWU5b0VtOHlSdU94ZXRLR0JUOGhkUWZVcFZCQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a84fa674-f0f0-42f9-1e1e-08df19604e38
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:49:13.0855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2TsKyUTNCbRoBiAJXe+0iKo+bFAhmjjtn867u5d1YQ/lsTKbL7ATfTGRQnGaXV10NEmi3/90zIO+Jaoyd/RdTP2+CI+Bpnjg86MmdQcN3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7926
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 10:49:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10604

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Most command blocks in the manuals start their lines with "$", but a
> scattering of them do not, and those read as a file listing rather than
> as something to run. Give them the prompt the surrounding pages already
> use.
> 
> Transcripts take a prompt on their opening line alone. Two things that
> matter only once a line is a command go with that: a bare "$" at the end,
> the prompt returning after the command finished, and a trailing "\" on a
> Windows path, which a shell reads as a continuation into the output.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
[...]
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index c7d0fe3dab8d..73b7d9501ae4 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -423,7 +423,7 @@ your Yocto Project build host:
>         replace the PackageFamilyName and your user on the following path
>         to find your VHDX file::
>   
> -         ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
> +         C:\WINDOWS\system32> ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState
>            Mode                 LastWriteTime         Length Name
>            -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx
>   
> diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
> index 5e333b6265f4..3e1280943bf9 100644
> --- a/documentation/dev-manual/wayland.rst
> +++ b/documentation/dev-manual/wayland.rst
> @@ -80,9 +80,9 @@ the CLI, you need to do the following after your image is built:
>   
>   #. Run these commands to export ``XDG_RUNTIME_DIR``::
>   
> -      mkdir -p /tmp/$USER-weston
> -      chmod 0700 /tmp/$USER-weston
> -      export XDG_RUNTIME_DIR=/tmp/$USER-weston
> +      $ mkdir -p /tmp/$USER-weston
> +      $ chmod 0700 /tmp/$USER-weston
> +      $ export XDG_RUNTIME_DIR=/tmp/$USER-weston
>   

This is to be run on the target as far as I could tell, do we also plan 
on using $ without a user@host:path$ for target commands as well as the 
ones the user is supposed to run on the build machine?

>   #. Launch Weston in the shell::
>   

Right under this context, there's a command to run which doesn't have 
the prompt and needs one.

Cheers,
Quentin

