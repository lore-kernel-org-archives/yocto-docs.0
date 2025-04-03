Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BE4C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 14:24:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.53])
 by mx.groups.io with SMTP id smtpd.web10.14669.1743690240673128634
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 07:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LHnrT4VG;
 spf=pass (domain: cherry.de, ip: 40.107.130.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPTz+4bK1CdjwASdkzMizLRy85y0RLx+pL2ey4m5E7uvHb0EaVhGTWn8A/Q9SOu8TMok9qllQwWoToSnwXA5eMUOv1w82VUwWxVpIjo62D8keUN5RewKtoBcj6OaC5jwbj50s5VS0xAMs1Ny1R90b0ApNnAUIJ3XSXNTrjuxwzlDZLd0FKGIgNp4fzj3pMn4P6zrcQolcvm0Qt4Ewb8/Fd/VqVz6eRi1sL8icQRND9xc2wlq1uq63Y2x0QtXaWo5JawaasGeNY6JxBQSYOnSzdelMepLQSQuUGNOTgrj00yT8/BwaxorxfO4xU59lMAVIlgXJxtYraske9Oba/SOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRPXKV20KMiXGtoSUn+ADWj6tKY6ISpmo5xg3bec8QQ=;
 b=xY2jdnal2K+P7jdhe0LgDvDv4s2FJdX2FzXcBmVsfxwxub6zeHNsQ4WzXkqM3MiiJlHQ01JhtVA1mHtaFKGm+heQLbpDr9xCJ+5UzVNAQJ7TFix+H1QZIgd4DkbGy5UUNCsg844B9ZCkdzUPMngoUQcdCoT4oNofJX73gNxcmDiAiOxKMP0eo3EISSXDR6OM2tz0kl8F9CFHs28GSg+tYiClnthvhGJUkv2aYJX8YmCFif0mA9AqQ4MIx+05WthKq6NSWCM/ZYPYefMpPpAHOrkFotYx5r4tWpnIMSh23ValwEX0RsDipov5PLmqukcqYq/plBMm46Pyh+XuAcNGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRPXKV20KMiXGtoSUn+ADWj6tKY6ISpmo5xg3bec8QQ=;
 b=LHnrT4VGcx7fwwm9WL3ZuYSV3WdCvBGesLf+HoXds+v1VRUKZA8cJSZhBkTIvuMlFmIOwEcDyEsiA1EpeTKJc9Q2sSJAj1+zsgkoGtLZ0JgFfNHcx7wFMC5xd5tPVQ82JDFn4FscCwHXgMRP2WGa0NdVqzPhuns3isYKxpVNGyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA2PR04MB10471.eurprd04.prod.outlook.com (2603:10a6:102:41f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 14:23:58 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 14:23:58 +0000
Message-ID: <874b31e6-63df-4d13-b967-3014e6ea8ffb@cherry.de>
Date: Thu, 3 Apr 2025 16:23:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] migration-guides/{migration,release-note}-5.2:
 improvements and fixes
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
 <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA2PR04MB10471:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c83aec8-f0a3-45e1-7f43-08dd72bb2c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXEwZmtpVTFZc3RqeXZKYU53V1huQTdEUGFWaVhtNjlSQVBYSmV0T0ZJc2Ns?=
 =?utf-8?B?Tk9FTTM4YUs1S0pEUUJ6eE51ZjBGSnpRNDRNTXdTT1FBVXdMV2lGL2I1TjJn?=
 =?utf-8?B?UFBnYUlOazVQT3VmMU5vTzMrSkt3R3pkRlpJdzFVVEJmbnErc3dMTm8zUmtx?=
 =?utf-8?B?Uno2OEhJOTIxWHFCNEp1amE2ek1SRXExRldFSnRjUWptRHh0QVUzUCtoUEhN?=
 =?utf-8?B?Ti90L2xjM2F1NlpSVEtrdkFraDczak5LMnh4MkhkdUZiMEIrR01VV0RkazZi?=
 =?utf-8?B?K29YUHVna2daYmxYa1NGSTBTcFRmRlZSZlMxN21mZlA5c0tDVmROQ1ZBUkRw?=
 =?utf-8?B?MXdZWGpFa0JCSnpENUQzbDJGVzFJb1BoaGtla0k2YmtqZDBXdGx1aDdHZlB4?=
 =?utf-8?B?NUsvakp6eW5KQTNyM1FWWmtzM3ZCQUtwdWc3TU16ZEZjUmxxS1ZkWlZtVkhk?=
 =?utf-8?B?UmZ5ZzFJblpubG1DbHM0RzFmbEFDVUJ3MnBIcWF2NXdYeDZONDlvSDBmZ2JE?=
 =?utf-8?B?MkdtV25xL1pWY3lSRDF5K3lxS1BCUFBMbFdvbTZwTld2SDJFdVZYV0g2VmZX?=
 =?utf-8?B?MlFvQ3lOYjkvaldLL0RwYWJEc2R2RXdmZGhOUjlKc1lrZjdQYWFjSzMrRTgv?=
 =?utf-8?B?eE1DTFdDaGJnM0Fad3Q1Y2R1YXk4LzFnb2tIUmJZMm55d2x3WTR6c0JDc3Fr?=
 =?utf-8?B?anIvYnloRkl4MDd5OXE3Q3dJSTU4WEpMK3R2Y0FpVHVpbHNUMVdpQkZSL1Jo?=
 =?utf-8?B?dzNac3FaVVZWd3o0UGpJdHBXVVJ4aFREUjM5L0Vjb01RRlFGcjNidkVuajVv?=
 =?utf-8?B?MU9GSVpaMVZRbUlJUjhhNTlKK3hpNy80NmxaZTZGOGk4alN1aTZtbU8wTytE?=
 =?utf-8?B?U3FWY3FJbHAzcTJPNEdVdUNaNWtDRndDbjU1ZDM3SVBUcGV3MFFzdkxuYVBn?=
 =?utf-8?B?Smw4THFBM08zMEVWVlBvTCtRRFdRQUFDcStPRTNGSFhwbFZ0d3lNY2MzZ0Rn?=
 =?utf-8?B?QXlKU3MvRnFXeE93dEMxZmdJd3phK3hHYkNwaVM5SWdmSVMvY1JrL3YrM2w2?=
 =?utf-8?B?Qit4RHlVL2NSbnpqRUtwR1Y1c0NiZ3g4N2N5WHYvdTd6eHgzd29BQkEwMVZK?=
 =?utf-8?B?YXdldTFLMGNPL2V3ZHpWY2hxVnBhV3RxenNqZHFqMVhhQTJTbVZtM2tvMVlh?=
 =?utf-8?B?SEduM215cUsxQ25lQUdSb0ZDTzQ0RCsyaWxraThCeG9QQmFMQ3lDMldoYmZH?=
 =?utf-8?B?aVNSK25rUDhxLzYxYzFHUnU5V1JmaDRTNjZ2NytNSFZXN0orVXo3c3AzTnRN?=
 =?utf-8?B?VlBpRFd5NDB6UGZVSkM1Mjhka1IwaVNUSmloODdHZEdzRS9YUWVjdVdvNmJa?=
 =?utf-8?B?dWlSQXhhUklBck54RmQ0b3NRKzRSVUYveXhpNUl3d3pacWpXSm1VRENQLy9w?=
 =?utf-8?B?dnMzODdYbmc3dlI1dVZUQklLeDBZcFhDQ2RWNDFiaTIxU1ZSS1Y5dkFaZHEx?=
 =?utf-8?B?U1VQMUNlRFczRThXN05GclNqUGFPWWNkZ2VGZU1lM051TXRObTAzcGtiaExB?=
 =?utf-8?B?U3htQTc3Tm93Q2dLUGlnWjFKZEpuNTNtbElIUmNaM3k4SVF0Q3V4QzJCQUlR?=
 =?utf-8?B?enFzSUpOaFNGWFIzTnorOW1hZEh4RkJBZHVYMG91a0hBbkgxS1RmMm5RS0Fx?=
 =?utf-8?B?MjlVOENOSWEvRU1FU2p4WFNwOXlkWERDSk43KytWeVFKRjZabjMzN0JBbU9T?=
 =?utf-8?B?TmdIaUlnMzF1dmxLb1JaRy9ZUVhJaEdrTE1rWEJZekRGTk0wT2JzR21QUUM1?=
 =?utf-8?B?M0hvUW5HLzl5aWozUGdFa3hFcjcxRVZiTFEyYmZDS1ZKcUp4djlkcVNrZjNN?=
 =?utf-8?Q?8+WYHu/YRlflN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alZhUThHNlkrdlFEOW9CS2NISVhSS3hRT2ViM0NXUERxSmZSVVZGZzNmUnlS?=
 =?utf-8?B?dVVZV1ZYMkRUV0NFR1JNamtjTHJrTDhqWW5mNjdFVEdOTWhaMGNDQkdGaDVo?=
 =?utf-8?B?cXN3ekNqQkZXUXVKOFRqcDNXVkdtalRjcjhOWkYxR2xOeng3aHhjQ20wWEZR?=
 =?utf-8?B?Vm1XWTVJRTlzdWp2UWpmKzUrSGdMejc4WEFFMjRKQ1ZQakNZUUZRRDdMREZ3?=
 =?utf-8?B?RWpMbFphY0tJV2dlY0ZJdm0rWWE2SXMydUZsQzJQd0tJS2hQYk8xNG9venJW?=
 =?utf-8?B?TllETmVRek91NWU5T1hxR3lldFNyN3U5Ni8rNHNNMFY3MnZmaUVWSHc5VDUz?=
 =?utf-8?B?WC9rZXdGWTg5WkhYWE52djJqTXU0dkJWeDkxQms2UStKaHJWUlkwZnJVNzIv?=
 =?utf-8?B?L3lxVHV5MDcwWXBnbGZsa0RSWnIxVGRFTmxYVEVvMTdpR2xWaVRoeEVUZzFQ?=
 =?utf-8?B?bldObjd0R3J4SVNwc0E1VGJYZTVITUFxNkRoRmgzZWhRUnVIazFzWjdCWkRC?=
 =?utf-8?B?bkQxNEw5cnlyMmdBS1RLNUhYdERadkNTVGgwclVtdGRFZ0Q2cWtCakxDZHk0?=
 =?utf-8?B?MHgxV1JuNjNMWjJWcURHazdpZHhXYzk3M1l1RVE1RzQzL1lrakpHaWJvb3dN?=
 =?utf-8?B?V2FvcmFXakx4WXpBc3dqN2lEeUJBbVk1VE1WVjVXWHVkemJQWXAycUVVVTgv?=
 =?utf-8?B?L1RiTGI4NWJsQnJpTmJnOFRLWG1lRjFtM09aZS95eDZ2YUE0WWhmRU9JVzQv?=
 =?utf-8?B?UXh1Tmx0TlVEREh6eXN4Z1NTWjJCSjBMK3hQOUx3QTFNUW1aaTZDbEFQZWhB?=
 =?utf-8?B?WnEvNytTOUdtWTRJLzYyOTB3Z0dLcE5YUUpzVjJkVWhyalNTV1dVdlVVRFNW?=
 =?utf-8?B?M3BqYThhWWs0dTd2K1FmalhhM2RPZHBrSFBNTC9WVUxCMllKQlRJZkdDVXk5?=
 =?utf-8?B?OE9yNjZ5TFBHMTVia1ZEaWN0ZzFMaHhxWmphSVd0MWNvV3Z4dnFCNDV4dld0?=
 =?utf-8?B?aGNlUEU5WjJVOVFMK0JRZEtucFN4dGlPQkhtTkU5RXA4ZTZ5dHloQ0hSenFy?=
 =?utf-8?B?Kzhla0tWS0J0S1BZK1RhbTZWK01xT1BvVE1qRE9PNmNkUEhyUTN4VGpFZTZ3?=
 =?utf-8?B?M0ZjQ3ZTbi81OVFsekV3b1lWRGo4R0ExWTcyazJuc3Z3UU1pdkRFMVJESzNN?=
 =?utf-8?B?SEVZTmhzcS9NZmNvMktGOXpaNUswODZNdFlRQklDYVdQc1htaEMwL2tHM3lm?=
 =?utf-8?B?ckV1OFZOc3J3WkxqQ0ZwSnFjYmJ6WWVLTEtuUGVWQzNMaXI2UmxhMzdBV3Rt?=
 =?utf-8?B?am13SHpncC9rNzNqM3NySHNCSndBcXBLSmcrMUJ3WlpxUWtpakxRaVc0d1FP?=
 =?utf-8?B?eWdGM0h1K3NEd0Rnb0N3R3VCelg4QkFlYXAvVjh3amhRV0wrV3JvdUJVN1ZR?=
 =?utf-8?B?cU01ZWRidksvdG5qZWhwK2tpLzR4dGRML0pLTFV1YnYwVG9SN3Z2b1pQNS8y?=
 =?utf-8?B?VVZQdjAwWDFaWmpDbWt6eW5hSUNIMGx5OVZaUmNYWmxyU2xUZFJGVktrWkFN?=
 =?utf-8?B?bkhMYmNNRGZ0OVZwUkcxRWUvUzFDempFT3poaFFjdVBWT3RoczYwMURNeWF5?=
 =?utf-8?B?WXJBaGhldWM3TWtqWXZnbUg1K2lGcTFqY1F4TTlUNFRvUXM4Q0s3S1hxcVVT?=
 =?utf-8?B?NnQxSHVMSlh4VVZVd3d1UTVvNFZGUW5Qek9PdGNFWkxzcG9LNG1mWnJiVy9W?=
 =?utf-8?B?RFQzWWhJN2lBZ25Yb1VjdEY2NVA5RmhFcGdlOW80ZGpwTDhvTHdadk1sVndW?=
 =?utf-8?B?Y3hieGtGYVlLb29OU2NnRTMxSFd6N2J1NFdLeXBXUFBvVjZYcHVXUmdXdlND?=
 =?utf-8?B?ZXZRYy9NVjAyb25ZaCtRRm1NM1lKOGttbzhuT3VuTjNOU29KeWt5eHFRYVhF?=
 =?utf-8?B?Y2IyaWJrYXpMSHlkYnlIVmJwME5GMDVEYm9MTXJkWGNkaUhMeCtLMW9Vajlj?=
 =?utf-8?B?Mktya3VHNnIyWURiZzJuZVVHaXFSUHdHMjlPSGtHcExhWWpHMEV4QXVCcmR3?=
 =?utf-8?B?SmI1ejJyVVcrdkNxd3pZcTlyTXVCSWJ0cFJXbHBTbXBNRzc5RVZsZUxKNThz?=
 =?utf-8?B?OEtPUEI2NGEzaFNlcWZYcWJXcDhTWmswaE5zeTlOeVZlWUl3R1BraUwwTFFv?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c83aec8-f0a3-45e1-7f43-08dd72bb2c7c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:23:58.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBQJy3lqIC3HxYwe8WzAXVhBbAUamgVq9nPnuNK7rUXlp0wZQZW+UfbjiaTeD7p48mA7vXBLGryvz31lZcA1q+8e2q6EF/vJHlbaN2wHO8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10471
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 14:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6708

Hi Antonin,

On 4/3/25 4:08 PM, Antonin Godard wrote:
> Address some of the reviews received on the release notes and migration
> guide for 5.2:
> 
> - Remove the wget fetcher addition, I misread commit 0a9f90ff658e
>    ("tests/fetch: support setting PV in the wget fetcher") from BitBake,
>    and it actually affects the tests for the wget fetcher, not the
>    fetcher itself.
> - Add a way to transition from the branch=nameX,nameY syntax. From what
>    I have tested, I achieve the same behavior when using one or the other
>    syntax.
> - Remove the default value for SPDX_PACKAGE_VERSION in the release note.
> - Fix a couple of typos.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst     | 10 +++++++++-
>   documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
>   2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index c54f054c7..59f21ff4c 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -193,6 +193,14 @@ anymore::
>   This was rarely used in the core repositories, and this removal simplifies the
>   code logic in several places.
>   
> +If one of your recipes is still using this mechanism, you can split the
> +code source fetching into two separate entries::
> +
> +   SRC_URI = "git://some.host/somepath;branch=branchX;name=nameX \
> +              git://some.host/somepath;branch=branchY;name=nameY"
> +   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
> +   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
> +
>   Git fetcher: Branch parameter now required in :term:`SRC_URI`
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> @@ -242,7 +250,7 @@ The following recipes have been removed in this release:
>      :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-openembedded </meta-openembedded>`.
>   
>   -  ``blktool``: It was created in 2004 as an alternative to hdparm and never
> -   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active.
> +   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active).

Mmmm, should we say

s/remains in active/remains active/ ?

Slow brain day so maybe my intuition is wrong today :)

>   
>   -  ``cargo-c-native``: converted to a target recipe and renamed to ``cargo-c``.
>   
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index 05fc92e85..2ad441449 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -44,11 +44,10 @@ New Features / Enhancements in |yocto-ver|
>         uses.
>   
>      -  The :term:`GRUB_MKIMAGE_OPTS` can be used to control the flags to the
> -      ``grub-mkimage`` command in the context of the Grub recipe (``grub-efi``).
> +      ``grub-mkimage`` command in the context of the GRUB recipe (``grub-efi``).
>   
>      -  The :term:`SPDX_PACKAGE_VERSION` variable controls the package version as
> -      seen in the SPDX 3.0 JSON output (``software_packageVersion``). The default
> -      value for this variable is :term:`PV`.
> +      seen in the SPDX 3.0 JSON output (``software_packageVersion``).

The indentation seems odd here (but to be fair, it is also in the part 
of the diff that is being removed).

Cheers,
Quentin

