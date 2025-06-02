Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480CCC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 11:59:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.8])
 by mx.groups.io with SMTP id smtpd.web10.47792.1748865543444180919
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 04:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=buhJwXDa;
 spf=pass (domain: cherry.de, ip: 40.107.130.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTtljStDVwOqrNm/4MGS4+axnFW5ikEvZMUM/0lyaPs+gK9HvlTi9fsvNcy1qSXb+OO3VmWCYBxncCikG+/ITlkw23bN38Ud/0cqgDF3PeQobYu4e+EsrCoCodnGs8V0mgeEQieoBVrjW5QHrn3By1ZxnoOvwQH/prCCH/g/5vkDUeO/fgmG69QFSzla1AjHVmASPbAabSCrgG/ommV3bd2iU+Y1pGqjGna9LFZdsEqoRt0kqNVHS5Z/syIXyhAC2HTgYe7FFBX/N+Yd2BL5Ty2/qprWSgYlNXeUn53jQ7/tYJ0Yd37opHBXnrldB84OZ/dyWmcUNdH+l31W+nrvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT1zg69Qwt7YMt//A8usOz6bbiUHsesWLjLjRwYC/HM=;
 b=dZifvTnurzaA8EfHEf3HRKbYExXnGEUJI5vLFM468bVUe1FogAYyW1xXybniHBYb5JA16Ulp2Zv6DRToG8XDkppN4hilwlc3gVmXZ/IUEXtJCUe8JmDVf0rBgcmvF8otgf7Mqo5gRGNcR7HsgERkjt+zH83jgIOeQIumyO+Yd4QRI1sYW4SQ8MaobafhkBVIbdhR5bSRisdAMDOkth/OC88qOhGhg1Eev5zdK74kERCCTF1358anIE1gl1rBpNQXbZYFdcPVV9GjeOm1COTYgkmilkOcCCJVUNBfXIioRWWCdKk3N0qdpKdA6Fl/mdaiIHE0G290A8TEWDJ7RkXr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT1zg69Qwt7YMt//A8usOz6bbiUHsesWLjLjRwYC/HM=;
 b=buhJwXDafsFEm995B0GDajMV2+rjNDjhI1dgPZDFJ++PNmsKyPMBAl/60f3I9nSqaq2X3tKY84frMZbXHhbFQ6lx73oCLGC+jifCgrXSRkKr+SZzE82WzxgJZ7KAA/U6N9tXZy6COj9lJcU0RxrBnx5xwEzaMWiZ8RjZ8mx/HVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7859.eurprd04.prod.outlook.com (2603:10a6:20b:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 11:58:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:58:58 +0000
Message-ID: <54c47e33-40ab-43a8-9dd2-3089f28d49f5@cherry.de>
Date: Mon, 2 Jun 2025 13:58:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Should bitbake manual mention use of unversioned recipes
 with bbappend files?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <e44eda6b-722f-4d56-fcbb-9e08e56669b8@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e44eda6b-722f-4d56-fcbb-9e08e56669b8@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR08CA0264.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::37) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: e59b1895-491f-4898-ba30-08dda1ccdb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHUxRDBvTVk5SnVOL1ZNdkttQnozOExCeTBUUUxzL0lHUHpWb0hMSER0Nmpj?=
 =?utf-8?B?L1VzU2UyUDNWWmN3Q0o1Y1pub1pxQnhzTldueXFmbHJtQ2NnaWZabVQxazlO?=
 =?utf-8?B?NXFCejFUR0ROYkhXelhrV2FvQ1lrTjBlVUxyTDV3eVhMcXNLS01vS0gvclZG?=
 =?utf-8?B?MWU5YS9Zd3JmOGVSUk1aR2RpVDZqbkNIdUEzVXFWUlowZkJmVlYyWTVxS0JD?=
 =?utf-8?B?WElTRVRzYUJFUlRpaEx1dFZSTXhXK2c1VXF3U0h5WklXN3lOeUNXT1ZMaCt2?=
 =?utf-8?B?dWFSaFRYSGZ4QXdOOEh3b1pzdE4ycVkzbStzWlIyTDEramhFL3ZnYTRMeHpa?=
 =?utf-8?B?VGF0azBiZWZVWHdIVjkyYkZmR2k1NE9POXZpcXV4NHlXSHRjbmFBc2VNOUtZ?=
 =?utf-8?B?ZjNFcDNBZ0Vqakx0L3B6VllybzVJQnU3VVc1WFBFeEU1L3g0U3RYdlEwKzFI?=
 =?utf-8?B?dlY2WXVIYTA5bkxsQzhqQityY20rbzh3eVJwWGdJMXA2UGRwNnUyUkJtMWRR?=
 =?utf-8?B?aUl5RFV0bFBCTURtNS9YMy9WZjgrL09sKy9TM0xaZVFobjNPRHJldm8rTlVp?=
 =?utf-8?B?Uzh2Y3ZNZHd2dWN1WWNDbmFnUDluL3UrRExwQTQzTnZjVTZKcjRHWS9uMXBk?=
 =?utf-8?B?OHZyeng1bFYxS3J2WG11MTlzNVNwN1JvMFlpUitieXcyNmw3NmtiUFoxNHpt?=
 =?utf-8?B?bGtCQ2xHclV2aUpORVVERW1SWkF3M1hYak9aNEtRUlRieGd2Z3hyQzFFa3VL?=
 =?utf-8?B?MG5COEpBbW5zS2dhRzk1Mkt4RmlkVTB3d3RmVHJLZy9laDRiWWVCTVYrcEdC?=
 =?utf-8?B?clNZclc3Nmk0TEVFTGRydkJCNnpUWURWcUw0ci9sWFBwVUU5YmtsK2JoYmsx?=
 =?utf-8?B?bE5ybGpEMHBTNXI2Z1B3SVNBMzBLZlA5dU9UdVJaYVpjc2JyTFc0d29SZ3lw?=
 =?utf-8?B?VktLV1l4NEt4SDFld2E2YjZCN0M4Q3FvYllzQTlWUzdUUkRXNG1VQ2xpYkxK?=
 =?utf-8?B?Q0RVTWN5YU9WZmZwaEU0NXU1QTZFVGNiaU5Oc2tqeDJSZTQ0N2FJT1h3UktW?=
 =?utf-8?B?YWhSLy9CaWRhU0tCNnZPUDgzSHNwTnN6YXdTUS93cEY0VFl6UXFBVks2TXRE?=
 =?utf-8?B?UDBZL1gvQ2RYbExraHNvUDZ3NFczUy9UR1hHVUNXbVM5Q2VLYWFXdkxvZjZt?=
 =?utf-8?B?VU10TWFISEpVMWRRQ1VadnJzMDQ1RDF3VTZ6ZHRJc0tCU0JOb3ZzRStNQUFG?=
 =?utf-8?B?c0hmSjc5RU4yT0lodmZ2U1ZsY3ZIZVJJcUhDTW9CL1Fza0Npb2lWQ2NtMmtS?=
 =?utf-8?B?Rm1OeTlzRlRoM3Fab1piVXI2NWkyZ3BmLzVwQVBNMjhuSUF3cXVuaUtweG1r?=
 =?utf-8?B?ZWlBWmJoK2tFRC93K05hd2Fqdkp2Q3dNSTA3ZzBOQlZkM2YyQ0lORzBZSDJv?=
 =?utf-8?B?alNwNjh1cTYwRGNMWXVYdTVKd240Rm5wSXpCTTVSZWpRV2wrZVBHZGNienU2?=
 =?utf-8?B?OU5rbmsxQUYwTEhieW9Bc2k5Y09TdXJNS1dPcVpGZDVMcnc5MVBFM29KT3o3?=
 =?utf-8?B?d0pvcUVlTjdRY0l0SFZiYmhqUjhhTzNLR2FWU1BONDJtUGREbWsyZ3pTVEVu?=
 =?utf-8?B?SndySTZ4dlE0c1gzL2lpS3dGQTFFU2VVTm4yS3lvRlZ1LzhKL0ZaL2VObThH?=
 =?utf-8?B?NDlwRkJPUVEyV0ZraU9jLzZ2T1dENnBQeUJoUVJ4cGwxMGVPVFlCTVBJbTgv?=
 =?utf-8?B?ZzhjelZoNmlJclV1ZVBic0RicUVPbWNwbDJhZXlXMm1BRzM1REtseWpxc1Zr?=
 =?utf-8?Q?JzBmSXn6QYiAF92z2QTw4U0U/J3eYqjZSlfbo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1diY1pxV0E1bVFXMXEvd1kxZWVsbEdqRTVDWUhNZnZrdnFmOXQ4SDgydmJs?=
 =?utf-8?B?eVFNTUVNNDlMVHBNcEZ2aVI5VTh3emUyaHNuN1QxbzA1M2czUXZ3ZUNEVXdM?=
 =?utf-8?B?eXpLZ3VBQTY3NzkxN3RHSUlFbFY3TlhvUm92QWtvb05Da1hHQUw5VE4weFFP?=
 =?utf-8?B?elhwQlc3ckxlSHR1eWx1bG5mdDk1bzZTMXNGeVJ6RHRZK2dHU2R4UkRHQUl5?=
 =?utf-8?B?d0tkOHRBWXJHV053SnJ0SFRscEtWUFI4cG1RUGRYME05NnloYlNVNldJOHRT?=
 =?utf-8?B?V3dma0JSOGVPanFKbk43ci9PWFZwdzFPTnZlTy9UNVNVOGdBTFNqcm1kcVU0?=
 =?utf-8?B?UFJtWWw1ZmZrenJDTEVJdEhnUlY2ZFc2ZEw4eTRQN2pFWUVVK21Hd0FBUHVH?=
 =?utf-8?B?NTRWYXY4RXhZZUwwNWUxd1dLVytZSTdSM0J2OHQ3V2dSc29UR2JROFFZdHB3?=
 =?utf-8?B?b1JjbUV3SkVlblJKczVXVzhudktJdUVJNHZDc2hnZmVMWnpqUjhJM1JqNTVD?=
 =?utf-8?B?b0RubEx6Q3k1N1dJRC80MER3VWhoNE1sODV3TEVSOWdjMDRJcXM4L3g2UWZh?=
 =?utf-8?B?YUo0VkZBSVhzNmZGaXZRYUcveUhhOFlHRUdlWStSbFRCZCtIWTE3VVFlcXhC?=
 =?utf-8?B?SzFJUk0rTzZSY054WkNqbWl4TE9XOTdyU3c5Y1NTN0dNRHVxNW1rbTNXMnF6?=
 =?utf-8?B?eU5pZ1NrZkNWUGlZbFU1VTd2eWEyWTBiYzZFVVdTZG1kYWVOM1EzM09jblhN?=
 =?utf-8?B?SW03cDJQZ21YYXBCTU1KUWUyem9ieFlNTFRPRUEzZWpYWFQ2MWJ0L0kzdnYv?=
 =?utf-8?B?dWxqVDlMbVRncDByWWlvTnZsbTBlaXF6c20xcEowVWkwQU1sZDV3cDlDZ2Jo?=
 =?utf-8?B?aFBQS2w1S3BWK0hReCtLaCtFekNPOWwyMC9WcGtvREpqWExDdm1oMmxZb2JQ?=
 =?utf-8?B?emZoVVhWY0wrRlhpWEpYV04xVGI5dGVzVXNDVkRJWGZpNDZWMHlzOXZyS1hn?=
 =?utf-8?B?K2ptRU9XZE1GMWZzOTRXOE1meXF2bFN3SERRNGZJUWJxNzl5RnBydUVkZ0sr?=
 =?utf-8?B?YkxLend2RmxDQXJ6K0NlQ2pic0haQzEwamdIRUJyWW9QNTA3WmFsRDE4OVJw?=
 =?utf-8?B?TmY5QlRSUUJWelpINWM2c0NzSHZlRHcxTzFjTlNIVm1sQXpwZVJtdEM5QWVD?=
 =?utf-8?B?c2ZRN0doVlo3YVZLVGhZeGQxUHB5cmR4SFN3TVFXaWIzSXVmVCtFRkNDcFJJ?=
 =?utf-8?B?Si9LNTZDMUFLN3FpcE1Xb3o0UTI2amV0Rkk2N3NmRHEwbFhnUmV5cjhHTGJp?=
 =?utf-8?B?TGtIZG8zb1Bwdko0b3pNSnFRZ3dLQ3MyVmEwemluSytMblNZOWZaeU40VVRK?=
 =?utf-8?B?dXAyRHBSNFJJdWlqQ2grMDZNdFhIc0tqL0pmYXhkZXJPWW9MOVBFSFFrTEZH?=
 =?utf-8?B?T2JkQkRjekozaWpYbGcxb3pheENRcUt6M2JEVlVuVXpxRDZadDNrWGdBZHk2?=
 =?utf-8?B?UE53ZCtRcW11d1oyRkxuaVl6WS9lbkRqWjRLV0hTbUlYa3FsL3E2RmhKSTdF?=
 =?utf-8?B?YkJhTGhDL003Sm9OME9sYitTMzRINDR4d2V0SW16VUE4VmEyaGZRZG1CbFlP?=
 =?utf-8?B?Q212c1ViSDJadk1BaDBNVGt0S3N5bEh5bEE2U2k1ZDNudlRqYkh1WEIvUTlD?=
 =?utf-8?B?a1pqYnYvY2NIcVFCNGgxS0labEorZXBPdlBUeEZXVklmRHRNd2E0NlVsVS9S?=
 =?utf-8?B?QVh5eGpueENqUElyUFBoWFM1VS9XeHlMNW1YQzEyakxNZis3bnhJVm04ZjEz?=
 =?utf-8?B?LytKYW9YV3VQM01SQ3hNUzlhdWh6RnBYR3gxeGlST1crRllyS0FBOTRubngz?=
 =?utf-8?B?eno3ZXNyOE1lRFpiWTZGYlNOZExpRDcwTlcxTVpWRGpYdm5KMVRHSGU4UHBZ?=
 =?utf-8?B?UVcrNEZNczlOVElBb2VpcllrWWRxVXYwSXRnSUErV2c0WjZQb1hrYnlmZEs3?=
 =?utf-8?B?L3lTZDEzd1ltZmwxNUpRREFLZ1BsZHVySWRBcVk2YnViS3VaL0ZUeEdybkNy?=
 =?utf-8?B?bjdTcXRKdnpYcUF5Tkx2WjkzUGZrVlVQbW5YM2ZEaHhBZ2dHTENkNGpxL3RE?=
 =?utf-8?B?Z0FXTWJtTHRZN0RLemFXbTRCZnFFTTZaRlFNRlhNMXNuTzY3QzJRVGprcm5G?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e59b1895-491f-4898-ba30-08dda1ccdb7e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:58:58.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uTUsmzerqlqN9PEFldYtPEWIvWq2VXhOKc3xBUg0KOg06Sb63+nf++jrOcIg1b3cXNSLvW9XxPOvAGGwC+VxMSfDrI+BoOyhoBBmys6LA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7859
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 11:59:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6970

Hi Robert,

On 6/1/25 5:47 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> (Is this list for BitBake documentation questions as well?)
> 
> This section in the BB manual:
> 
> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-user-manual-intro.html#append-files
> 
> describes the proper use of wildcards with bbappend files, but it says
> nothing about the occasional BB recipe that is unversioned. One
> example in the poky layer is the linux-yocto-dev recipe and its
> bbappend file:
> 
> $ find . -name linux-yocto-dev*
> ./meta/recipes-kernel/linux/linux-yocto-dev.bb
> ./meta-yocto-bsp/recipes-kernel/linux/linux-yocto-dev.bbappend
> $
> 
> Is it accurate to say that, in cases like this, both files must be
> unversioned to be considered associated with each other? That is, the
> bbappend file "linux-yocto-dev.bbappend" will only ever be used for
> the unversioned recipe file "linux-yocto-dev.bb" and for no other?
> 
> I think it's worth adding a final short paragraph to that section to
> mention this (as long as my understanding is correct).
> 

As far as I know, if you don't have any % character in your bbappend 
filename, it's verbatim. So similarly to linux-yocto_6.12.bbappend only 
applying to linux-yocto_6.12.bb (and not linux-yocto_6.123.bb, or 
linux-yocto_6.12.0.bb, ...) I would wager that indeed 
linux-yocto-dev.bbappend only applies to linux-yocto-dev.bb.

I guess we could say that linux-yocto-dev_%.bbappend will NOT (I haven't 
checked though) match linux-yocto-dev.bb? (seems correct though as 
meta-rockchip had to rename mesa_%.bbappend to mesa.bbappend a year ago 
to match the rename in oe-core :) ).

Cheers,
Quentin

