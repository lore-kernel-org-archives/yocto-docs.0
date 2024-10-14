Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6402D1A42C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:55:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.54])
 by mx.groups.io with SMTP id smtpd.web10.52226.1728903309369492386
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 03:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=X+jJkSUI;
 spf=pass (domain: cherry.de, ip: 52.101.69.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH946tVfMunZSmkZuffCy5Fh9eiAkPZP/fJkHPq31SmQHx5BQdx4Tbsmj/5UqVnzSDRbi2yGhuld395lSpAY32GGyqaVOrp08HgAYi+UnNd8OMMGmSpZREsDZXBw4ca6CNqSHZMc1NpmUJMIkGoi0NdrMhh+266YjkmFamv6wKwteShXW+TSZoIqEaT551wM34jitLJ7pTs5bPHQDw/3nTnPze7Wji6z7BKxLC3pHDu8ZoC2PxsbUfNaQBBtjkP/50Y41DwpVjBlx8BBZYtqirXSQk/wQbYgwP9gLmA+B+RDE92AcVFa46608G2Rc6JIQDgQMJiCgcdNInup4Xo+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6N5S+ctM2nE5/r65VUJDjrOwoRopj8tylBVxUOUnPQ=;
 b=JkeRIkYr834QndXv65eqt7apfenSRZ+JdD+vxshattMolDZD5saKTWeSKQpCl7P4bNnf9rAAh6LF4RKRPSD6aQbVf33k5G+4dctLWHZ2qeuPoD3SSl3miCwV9sXvgS3O8fxzZVGdUYGaJgN26F4l4mgBWOwhHEtMNGrWMcjX+i86Qqm/U6YrRO1tuVeYjnxsE9LEmPNy7XDlPcRE3XVz343riHMLViUDHnmaK6Quh0gY4ZJKeGlNnCW2eVSLlTUD+J0g9WtpNiruVt44WcM1y2EjzaC9NifsbURrErNgIWlSGFL8TAUaVNfVdTFodd38bo/+n/uSYpc1K+WA9FWXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6N5S+ctM2nE5/r65VUJDjrOwoRopj8tylBVxUOUnPQ=;
 b=X+jJkSUIcRsbCx/89DUbjdm1epidK4ZcbqhC2LFzp5LkltaBzWAE7kjLK4d1bX/hYeQkprMV0wBrR3NKZFRF8vJW4nqhE77pt3iJhCYUT1tjUN20F/UySHdR835b5IkI1d4N1tIuaKCZ8kmh/35s1nnWZsTGEO7635a41OiUMmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:51:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:51:07 +0000
Message-ID: <fd96f072-fa22-4516-af80-d11cf20b65a1@cherry.de>
Date: Mon, 14 Oct 2024 12:51:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] ref-manual: Cleanup VOLATILE_TMP_DIR
To: niko.mauno@vaisala.com, docs@lists.yoctoproject.org
References: <20241011144847.1332607-1-niko.mauno@vaisala.com>
 <20241011144847.1332607-2-niko.mauno@vaisala.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241011144847.1332607-2-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e45a7d-93c9-4c0c-255e-08dcec3e1b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWlJanBDS2dYaVNPRFFHWHF3M1Noelh0SXg5MzFiVEZZOHZVQTl2Z2VnQ1Rq?=
 =?utf-8?B?aUcrengzVkliN0NGWHlPR3E1QjFGbTBNd0VIck9OZ3Bqc0RzS1pURjVhVjB6?=
 =?utf-8?B?YlpjSzVNNWsvcFNxMlhmaFdQVCsxSi9lRXJjTm5WUnRqZ2lkS2JWYUpvTEFr?=
 =?utf-8?B?T28wYUhrWHIrOEZiand2b0dkUmNqYkVVbnRySk5ySVZ5NmhDMlgrTHE5b1pQ?=
 =?utf-8?B?UzhqYmR4TmNSYTBVV3BUeWNjT2IxSTFGSkNnRTFhajc1UDZ4aklrc2dVQXRU?=
 =?utf-8?B?bFdwNVc5TGxYZkNSNDdmd2JNc0I5NDRBbDVxZzhhZVcwV3VMMkZxeU80VmVE?=
 =?utf-8?B?Wi9yV0U4eWhDc2xESWIvWWV1NFFNSW1CN2dlNDVnMWlYVnB2bTJyWG5lV3pt?=
 =?utf-8?B?QmZESmgwbXBmTkFXM2NNTXhPZXp2d0FpR0NNckFsVVc1aGwzbmM1UGJVMjV0?=
 =?utf-8?B?WmNnMksrU25wY0c5dEt3ZGRyTnlmZkhaMml0NXJpVnVyem0zOFJJRXh6NUpK?=
 =?utf-8?B?eVFINnFoVS83NEdKNzRmbWtIQkJ1dmpKZ3JiWXdZd3RGSkZiMUd6cG53N0hw?=
 =?utf-8?B?WE0rTW94ZlVVQm5LRTVPV0wzRTFNUEt0Rmt1Um94MFVKQ1BmTEh2eW92aW9X?=
 =?utf-8?B?Z2szQlg5bUgrb215K3RDSFVBODJETHJQZU1Jd1RUVXdsUkdkOWJsQk9wY29U?=
 =?utf-8?B?VkVWMlUxRGIrMkZjem9YUHFZK25VeEd3TCtNWUJoNmpZNm5EMW5CSzNiZkJB?=
 =?utf-8?B?QWhremNSNGxIcEYzN1RVRDh5MXFJU2tiNjJKS1YwWXA3WE9nU01NOVdvYzY3?=
 =?utf-8?B?dk5KTGUzVVkvdFdCTjlQR1kwcjlaR3VjZ241Nm5FRjdxOVJtcDNreXlRVk1F?=
 =?utf-8?B?ZWdERVRWMXJ5VW1DbytCQ1dZcnljS0RqQWZIRDdlN0Y2Y2ZBL011WUpwbGpm?=
 =?utf-8?B?WjFhSDJ2VjJ3bXNwY0lVQlJDSUZDc0E4QmpzYUpXOGRjOUw2a0pMSHc4L0dp?=
 =?utf-8?B?cUZPQmRwNWUrTFhSd0pmM1dpd2JIWUpuRHN5dTBaM0V5alRDVmdXai9LeGlh?=
 =?utf-8?B?VGk5MGhtM0FDekVFK1UvTzJjUVY3dTNnUXlNMlgzZSt6Ri9UeG1uTG9idHJT?=
 =?utf-8?B?WGwva2k0WGg4Q2JEQVdvWmVsT2dGbnlNVVpTRE5ROVlnb1prMERMeVRTeDJE?=
 =?utf-8?B?dDhuN3VxcTVKbE50dHRzMVRoeUdISUVEMWI2UzYwT3pVcUJhOVRpQ0xIand0?=
 =?utf-8?B?NU1BRWlqMW9IRHcva0hHVlhFcDlXQUZmTVhaNGhSRWtGenpIU0ErQ3N4R1N4?=
 =?utf-8?B?emdOUXorUmo3RmVyVkcvOUd2Q3RqaWZNNCtURlZBUG5ZTk1GaUJHY0lYVmd5?=
 =?utf-8?B?TlZKZ3JkaEY3NXlLZURVWWlnOVAzV1ZEaFRIL2h1eHVHNnlVRGk2QUcyeFZY?=
 =?utf-8?B?a2wrUXEvYzVwU25mZ244RCsrdU1zdXhIWllxZXBoVWE0aUJjK3liZUw5MCtw?=
 =?utf-8?B?VkVzMjNqcXJtRVRzN0xqaXRYTjNIV0QrUGkyd21wdGpZSEdQbzgyQ2w2SVF2?=
 =?utf-8?B?QU5ENVdBcEZScmpiWkVFRnM2bWJSMGxjaUIzN2R6Y3lacFpqQytTTERRTS9m?=
 =?utf-8?Q?o4ZxcqA6q7Dsu6R1yOiomGhgIS2PYsP5c7drqfEFH//w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2d0MHY2aVVOQzdSZXA4dkdsVWFRQUtRS2MxN25OWFMwaDFXdUl5TlZwVXFO?=
 =?utf-8?B?MjdudzhLVHd0dUgzU3JxTkdYa3RJQ1ZCbnhwU2NrRDR1YmRJTllQM2N2KzEz?=
 =?utf-8?B?N0pNYkU4eEFscXNpNWhMVXZ1M3RkYlRTSkR3clNzK0ZtUFY1SGFyOW1lNDkx?=
 =?utf-8?B?d05hcU5YZFRuTUIwMmZlL09lcFhOSkFacERvcy8rdzRMRisyenBvTTlIdU1D?=
 =?utf-8?B?Wmw1U1N4L21kTzIzc2NIaXJZcy9wWWNSRVBCUHNubHZ5VkNDS3FvSTZBQ0FY?=
 =?utf-8?B?cnBSdHdJQmd2bmRvME4vaXNqN3hqT3FYaTZnSjh3Slh4SlJkS01kL3dLaDJ4?=
 =?utf-8?B?YkVFOS9ZdVRFd0Z3YnZYczJzeXNYYjdUenJBWDhDdko3Qmk1MGJ1NDhOL2o5?=
 =?utf-8?B?aFpoUGhJaFFJRzk0RGRLUmk5YVlib2VRMGFZVXhURUxyVCs3S2lneU9MRzNa?=
 =?utf-8?B?S1I5LytoeVF1WEd1bWtiaFpWU0pvaS9ROGJzOURnMXdjU1lwMzFpUGQwd09F?=
 =?utf-8?B?aHNHeGZqM2tYd1ZIOWRZM0d4QkRzMTZYYWNUdVlYRFNtSXdBZlIzZ2x5d2Qv?=
 =?utf-8?B?a0hzWDBwMFdWcGZLVWJnU0QrajNLSjFYSUo0dmhMbXdzQVFkSnZwSnp1c2d6?=
 =?utf-8?B?WmVGcjRReVMxaXdvdkQ4Z2RlQkh4THZyS3ZqSVVvSjFmai9WY1hoeWZreXhP?=
 =?utf-8?B?NVd0WGdoTUNnMmo4VkRhSUZGMmk4VXF2dEJjeDJiL0hzZGVwczg1L0U4eEtF?=
 =?utf-8?B?bVNxS2VLR0FEamRKY1hteWJoVHFjQjk3L3VPR3RiQk5jUkpicmlPdjJzYnk2?=
 =?utf-8?B?bmx5WmV2NEdKa0prb2tOQXBBcDVsVk9vak5KcllpUklLcUkrQlZZTHFibnd0?=
 =?utf-8?B?eWhHTkFzTzhWdFR2NWQxNDJoamdjTGhwamlwWHMzeTdvUTVYb3FOdllWcUtP?=
 =?utf-8?B?ZEgrdTZjQ0dCeko2ZXUxcEtjYVdnTE9LeWFpM3BpdTdXWlE4elhqR2tYTmxG?=
 =?utf-8?B?bFZVSENDRTZhckJKUDJhTDZuTXpCd1VzNEs0eG1lajlSQy9IRHdtZStoSm1S?=
 =?utf-8?B?ckthTGRNYUMxUkR4eEpvVDVkUDZYNzN5VnNOUzdML1UwM0hVYXF5OG5LOTk2?=
 =?utf-8?B?OFFyNDNTcUNhbjJkUzhBYlRKR1JIdXFFdUN5UHdVVVRwWDJzRFhQYmlWUEdN?=
 =?utf-8?B?TFpKNzRyY1NBcVA5djAwZkpaY051Uk5vVzIwKzhHK09LeTRIR05vS0V1eVgw?=
 =?utf-8?B?T0Q5eEFiVytsUnd6TDkrZkd1UlVQNm9HZm0rVWo4aGVlM1ZWQ3p2RStEMEJm?=
 =?utf-8?B?clZqSjJwQ1ZnMW4vaU0yd2MzWE9tOUFhaHpUVDBFbkh1Y3Zja1pmUFdpMjJZ?=
 =?utf-8?B?S0FweWhCOXFVRFlWSkM1T0dCTGFkd0ZnckczODJtdDdSUmNHSnpxZU1ETk5S?=
 =?utf-8?B?c2E0VkN0bzlnN3ZOcjVoNUNYZ1FLTWJPdFdVSXFodVlaR045bmdjdWZjQnNs?=
 =?utf-8?B?OTltWFdueEZENEpVeGxUTitqVE1xRHhleGdrZ042UFZuV3VSbnRTNW9RNDU2?=
 =?utf-8?B?UUpodElDcFVNcUw4ZUhtTFRYWWVYNkZLYkI4Vm45ZEIySDdsOFlYU29Bd3l3?=
 =?utf-8?B?TXVvNWhJcFN3ODJWbjBjY0o5LytjR21PcEk2WlNkanl1eFQ2YlpuT0VDUFlQ?=
 =?utf-8?B?UTRQb3NEUmdlOS9PRU5ZZWtJU0U4RlZxT1NsUlFJamlGazlGZGtZOGdBeU5r?=
 =?utf-8?B?MDFyalRUV2ZoZDRodjdFOFpESHZZcFRLWExGZUtoWWxwSXNzb2tmc2hpUFJj?=
 =?utf-8?B?N2NkUEg1bzNIR2lZa3UvV0pwWllEZjVhdnl3VCtDd3F3aDBlMGZlcGNndHV2?=
 =?utf-8?B?Sklid2EyL3BHQVMxc2R1K1RvOS8xWGZ3REZBUzVMZzNUdUFvSEpSbVVWN1VV?=
 =?utf-8?B?Z1JzOGJYa09pNGZHOUNETmJ3STdUK0FGTUVIT3VhZDlTc3JDNEdxUC9HYjNG?=
 =?utf-8?B?T0RPbHpUcU5WZElEOTUyOVM0RjdPajc5UitzVTN0cGtZZUliZ21tQ1RFUWJX?=
 =?utf-8?B?S293dkJEb041citnbERmelYwelBxYUM2L05KRURPYWJXdnNualdia3dOUnQ2?=
 =?utf-8?Q?sc5OrJmop1kCpmgrvoHgCuTG1?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e45a7d-93c9-4c0c-255e-08dcec3e1b80
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:51:07.8432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybDK+jG4S26APQZu6xmXVryFSmPbIiQyzo3p3rZwk1eWsl9LfILygiAa8pYUccT3u6X0d5PgSeuBmXIutSUAJdcqRSO6vgrKTdX4GCv4MoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 10:55:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5479

Hi Niko,

On 10/11/24 4:48 PM, Niko Mauno via lists.yoctoproject.org wrote:
> [You don't often get email from niko.mauno=vaisala.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This variable was removed in
> https://git.yoctoproject.org/poky/commit/?id=2f46b6f27dfa3a9d5ad177900fcecfe64c3536f1
> ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   documentation/migration-guides/release-notes-4.2.rst |  2 +-
>   documentation/ref-manual/variables.rst               | 12 ------------
>   2 files changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
> index 30049b89f6..ac3bb9cebe 100644
> --- a/documentation/migration-guides/release-notes-4.2.rst
> +++ b/documentation/migration-guides/release-notes-4.2.rst
> @@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
> 
>   -  New variables:
> 
> -   -  :term:`VOLATILE_TMP_DIR` allows to specify
> +   -  VOLATILE_TMP_DIR allows to specify
>         whether ``/tmp`` should be on persistent storage
>         or in RAM.
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 71b3325c8f..7686e538be 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9983,18 +9983,6 @@ system and gives an overview of their function and contents.
> 
>            PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
> 
> -   :term:`VOLATILE_TMP_DIR`
> -      Specifies the persistence of the target's ``/tmp`` directory.
> -
> -      By default, :term:`VOLATILE_TMP_DIR` is set to "yes", in which case
> -      ``/tmp`` links to a directory which resides in RAM in a ``tmpfs``
> -      filesystem.
> -
> -      If instead, you want the ``/tmp`` directory to be persistent, set the
> -      variable to "no" to make it a regular directory in the root filesystem.
> -
> -      This supports both sysvinit and systemd based systems.
> -

Same remark as for the other patch:
- explain how to persist /tmp (in :term:`FILESYSTEM_PERMS_TABLES` in the 
glossary for example)
- provide instructions in the migration manual so people know they need 
to stop using that variable and how to replace it while keeping the same 
behavior,

Cheers,
Quentin

