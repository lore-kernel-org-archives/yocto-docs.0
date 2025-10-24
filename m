Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD11CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:03:31 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.4])
 by mx.groups.io with SMTP id smtpd.web10.13458.1761318203350101996
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=h5MAH6ow;
 spf=pass (domain: cherry.de, ip: 52.101.69.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0DrJsRjTho+6oaeBFEIsTSJ7+t9dgWFuSNeVjOBDuixHJDvmFXDi8dRkCP75d09BsteVM3zVzBlCxfBFvNnnFrhyF0DtwFjtBxrZDCq9fv4FB2hnxF2DonINJWvzkBHoRssmyW81P3PzWCVnQUAluGhu8w7vbTgH5bYaaH+dCAd9JQtjs5wRZ7ei6iZ+c6hQciPifXClVDbUG1ZrxQFNqzRjK7NoDIgEFEpaAgyAoLVEmZ/kkWeLgEOWa4SCwa7lmskfBrSEVGrp7lLSboNiqZYUJ7pPwc/nwF75xQu9Zt4JZNNZNxKRds7BCUBib3Y7FB6ZdixKt+czoyHRgt/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ59MowPhCxIRfuAJ+/bE8pY/EiE4paU+Cfbh8etM2Y=;
 b=amJsbQUgstjy7708w6i8qKPoGvNCKw6yRBoG92NkVwVyd/Eij/AFvTFlzgvIgfBFaPpbYeUoGLmAEFcqLvsCemePqh3uScHoRxEJZ7EYWtqLFz3i13q/xaVSu5jqUQ0EzqFzYxb+EoqT610wPkzNJqijYskPGtpzWQlskfBzD8k+1bbAnkfGVlHyr3FlIV0lKrZpdc7QNxtTtVCj31+YNjlk0/he/S0dps4vf6I7X1azGgqNVWHS+e34CJ3QGw4V5WznFfQumqZv5M5kavc6wOhIl362MegZuRUe9UU0Bs8+c92ZfSs/PGdDjQe8yNh77b0fIrA2ZPkvJrR7ooKQ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ59MowPhCxIRfuAJ+/bE8pY/EiE4paU+Cfbh8etM2Y=;
 b=h5MAH6owsDk9FEcrraL2RjREdzuzCJAU1bkCGY/MmA3WC91yhF7El4mo794ztXO9BT+mZtAy2/YIY84VVDXp+wB+AmZVPJ3u7ttRhV1+Y9LCpj0PNj9CaoYbU3R4CNzzhClmCmVM+9k4gtRmLQ9914hOUzgPz1JICT/lEq/3dMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:03:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:03:19 +0000
Message-ID: <c6317fa4-ec94-4b73-97ee-cb8d9f6eb7be@cherry.de>
Date: Fri, 24 Oct 2025 17:03:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 02/16] ref-manual/features.rst: add new opencl
 feature
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
 <20251024-release-note-5-3-second-hunk-v2-2-d15dabc095d0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-2-d15dabc095d0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0b4989-3e1f-41b4-95e3-08de130e7788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUlDeUhXQXdCTXJTaXQ4T3hXLy9yR0FPKzl4bDk1c01lQzU1Q2NlcEw0Mlds?=
 =?utf-8?B?eTcrT0VPcDE3U1VIc0tsdithR25sTFZHV2tFK3U3cFlNbjBBbHBUVUdqLzV5?=
 =?utf-8?B?N2o4MXhwdit3N2JRWnlTTWViblBDcVVzd2hWa2x3OHVGSTBzWVlLaVpFN1k5?=
 =?utf-8?B?SzlnMTJEZDZpbnFlam4yQ1R1T3ZEMXRhSk1zMWRYRDFseW9NMFNDSk0rNTBy?=
 =?utf-8?B?WHY4UXYwUnMxbDRIT29UVTV3SitOcmo0cnlSUUFLem9JbEp3RkthOUFSY3lx?=
 =?utf-8?B?KzE5em1Ca3JtYXJwZ294Y0tJbHZIdHIzYjhBdkF6eXYzaHR2enppVHVZMHpW?=
 =?utf-8?B?Y05qRGhmMkJoYkYyeEZIa2FPN2VJTzdFcnFRbUJlRE5yTFNPYURVdmxibCsr?=
 =?utf-8?B?aWZ1Q2pLT2laTzFZQXJsSjZvdVhpV2w1RDlPb1ZGVk5FZlR3eVVtb2EzeVJU?=
 =?utf-8?B?Mng3WFBGc09YZzB2b2JVOUdsM1lHQm51TEJEYkFaWnozdjZuMFZOL2gvbHlj?=
 =?utf-8?B?SG43L0dva1B3MUZIZlBDVC9MOXk4N0VtZmZac1lSZitHanIzTnR6NDZlZW44?=
 =?utf-8?B?dWZJcGp0VlNnaFg5U1A3TmE4K3orOERnVlV1QnBmSGpydmJjbmRCclBRTDlI?=
 =?utf-8?B?L3I1M05QajMwcnFQUi9JNC9zTzdTQ2tWQTJkcWpnQnVVeFJKaFlHL0V5VlFL?=
 =?utf-8?B?aG93aXdhYjdzMzM1eWxXTm1oUlBhc3MvQWVFK0k0SDZsaEpHUXpiUDIyVnRw?=
 =?utf-8?B?YUdHcGtScDg3WUU1V0RHdFJ0b0p5U2xBUTh4a3k1RTBnamZVV2k4TjhZSnlT?=
 =?utf-8?B?VnZjMzdWaUpuT0VmS3hCT1NnNHhJV1Z5SGZkNmpaV1ZwaHZUdUNIcHdKdUNF?=
 =?utf-8?B?c0Z5ZEEyd3lmWTdPc0N2d2JsVGxTQlhmb05YeDY0VStnTUJRYVlSZXFJbEhy?=
 =?utf-8?B?U2g5dktIVEZPYkFVK3VDK0VYemNUck1YazNFcFc4NXpzaXhXZHJ2MHM3UlVz?=
 =?utf-8?B?bitjMmprUzk1YnNRZEczcERKa3piQ0dpK282eVlvaWlZTjdtZVhjMkxCZzds?=
 =?utf-8?B?TGhDb08yS1RIQkFUbXYrN09hM3ViWWwyNEl3akhQU0tIbzM3RFZNZ3Z4bGVP?=
 =?utf-8?B?T3N5SHhkWXRCdFllRjRJMVRwWCs5NzVGODArT1haelk1ZVhnVVp0Rk4vMGJp?=
 =?utf-8?B?enZLcmZCdDVNeCtSUFpJYUF4ZTJjY3BYL3Q5Ymc1VkRpdWdyVFlWbUxpTlBY?=
 =?utf-8?B?SnlSa1BvVHdSMngrczljeWRjWkVYalZGUlAzMlZvcmVOaGxUZFVjOWVsUmV1?=
 =?utf-8?B?cUtBa3pqdXRjVDN1ZWQxRWlGUHhoQTU5Nkt0T3cvcDhvS2xkKzQ3RnAvWFFi?=
 =?utf-8?B?SUlkNWZqZkkzQkdWYU1SMWtuZFZzQ0FwVzZFM2Fta09BNDBLY25YUUxVaWE3?=
 =?utf-8?B?aW9rbkMza3A2V0FSaFYwU09kUEE0ZDRhdDdFUThIdXAvN0ZkekRRMy9yTml3?=
 =?utf-8?B?ZElBR1hVRGl6bW5kYzQxZ0pFUmgxb1h3dEJqOFlZK3dmZ2ttVlUxM2Exd1VL?=
 =?utf-8?B?K29WYXZ0cGtBYno0dTU5SUs3Mm5vaUxuRmpwREo4U3BNajEvQnl3MGhaM1g5?=
 =?utf-8?B?dStjVlorcXlpN3FiNWVnOTQ4RlpyK1VyK0hHL0h2eUJDRVRucUM0UFkyNjNl?=
 =?utf-8?B?UnBCbjl4TlNPYmJRVXdGMVliZFpjSkJoVVltUHladXhvZHdiMTZuMVFqMUVB?=
 =?utf-8?B?R0xiZGtVT1FvTlVoZllyd2NkcVZIWFlMZHEzNE9neldlTXdlUTlDMWs2UHNw?=
 =?utf-8?B?cHpWSnhuUXdHdkFFNEVxMDUvZGJzVkM0NkZ3VlVJYjJUdTNkZ3JJajM0a3lM?=
 =?utf-8?B?bWFubVZZVzBWSkMvblZSaU0wNE81bDZwcjBCb1FvZm9SeDVHUmcxSnhoeDdh?=
 =?utf-8?Q?P1XDPNy7Eoh417wG5Tcr2+e0x3IBkdqM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjNJMlN4RDF0M2d0Nm9tQytuRTNLWGw5T0FJd2lwVG1GdEtQWWFUZERRMXIz?=
 =?utf-8?B?MTVkbjEwd0lUSElYSTY0d2MyU25FMVc1bDJJSHR4bFJEeGFQVFV2WVhDVHB4?=
 =?utf-8?B?VXBPdThzOWxQMDNFNEd5MjVWY3daZzJpNU90a1RoMFY4UWdkQ0JyVnd2OUFZ?=
 =?utf-8?B?ZlQ4dG1HSG14K3JCcmhIdS9qRmFsYjQwejVqZm4xWTY3K3hlck11TkRaUndL?=
 =?utf-8?B?T05nY0RaZ0Rqazd4VFhTcGQxKy82VEEzdFpIckV4SDNleWtRSFBOc2h5WnpO?=
 =?utf-8?B?WmhKL1dac201a09NbDZDVlBrbmFNQkZNeXlWZTNzdGU1blkxY3lKcVhLL1J3?=
 =?utf-8?B?c3l3MUFpQmpGNUFuUTdDWXR4UWtwWlZFVk1zeUdwWG03M0dTRXZiNXdaSkVh?=
 =?utf-8?B?dStra1pDbFpNWGdmcjBlTmJqYVdBOTcvaTBSSFJGREo3SnhkSlFzelcva0I2?=
 =?utf-8?B?Ym1ndWdDZ1Mxdjk3MXZUN24ybXhNdHdiNEtQUFZwcVBKSTJaL2VzZll3WFc3?=
 =?utf-8?B?VERSWWQyclB5Ry96WWhlSmZ2UkZIRmF1d0djWGZ3REEzM3pEc2crT0NZSFlC?=
 =?utf-8?B?aVE3NjRObWVIRjcyOGdEeDR1Ulc5aWt2Uld2d0xtWkpReHBkRzMzMzJadTZX?=
 =?utf-8?B?b09VR3FxaHhVMUVZWDhOdFRJWXZqYnVpY1EwTERqVXB3SkUxQm1hRDIrcFJW?=
 =?utf-8?B?aFROQ29sdWdTK1BscGRKYndXaDZmZkhGTXNwMCtMU1hTMnJneWRDWlM1SHRB?=
 =?utf-8?B?SWwwcE9GWVh2RG5FV3l6WS9yZ2c4d0lLZ0Eya0FCNktMVHE5RjRPbmdRK3Bm?=
 =?utf-8?B?WEsvZ083Rk5DNjJNVGpCZy91RmJwMkR0SWxFMTFRVERLYjZ4cXhZRzRXVDlx?=
 =?utf-8?B?OGV3MWxpcnpLMGg2cTBIbzRWOVExeEEzZE56bDltaVN3akUrak04ZXVoK1hu?=
 =?utf-8?B?TEdxMjFaRjJXZTF3ZzhCMnBpWTRqKy9NZUdORzZFVEI3dk1nYnZId2hUTXVI?=
 =?utf-8?B?Q2JDS2R1MjYxV2hMQlpqUlFQaGlvdnorYTVkZGJrSHRqdVNhRmk1NWdIQ2ZE?=
 =?utf-8?B?d1liUDByLzZRV2FuenA2alhwNW4xUm1jWW5aRlFQZkY1QlZHZ2NCMlN1MXVq?=
 =?utf-8?B?UkFzOUYzMXhNam5IZWN4dTFEMkQ4cEFRWUliUmlRYmg0L3Y5d3d1dGZQeHpM?=
 =?utf-8?B?TkpleCtmZHoyM0F2aGdQU01TQmVjR0lLSTVpR0ZtWFJBbnFVNWM1RlE2b3dD?=
 =?utf-8?B?RmFsZlRHMWFNT2ZwZ2k1dk1pVEYwcWFGQmdsUHRUN1NRQVk4S05aVDJxME14?=
 =?utf-8?B?blNHUzRKZHJNT3lJd05JN0kzYlRIa1AveWVnQy9uVENCYWlGOWhvUk9iK1px?=
 =?utf-8?B?RXU5eWhKSTdJajlycWZhZzRlTVFES09IbjFkdTNmdkg5ckRvTW9XTXJxK0Nq?=
 =?utf-8?B?SVovN3kvek5XRHU4STQraElGSVY2OG0rWWpDRXFRL2hRUUw4eTNyN3Fkc2l3?=
 =?utf-8?B?ekdiSC81ZFVnSGtFZ0lkN29sRVBzN3lMSlZwa3Yxa0g1SjYrZFM0bHBhY0Rr?=
 =?utf-8?B?MkRoTFdlQzVjVjAzYjdjd01qUE50b2x1NDNuL1VLUG1tNWd6NFczeXRnY3RC?=
 =?utf-8?B?R2lDQlA1NVlydkVxWUFBazF3Z1FidjZ1MzJLUlhNMHBlOTZXYVJhOFlwa3k2?=
 =?utf-8?B?NGVzN2w2aWN5V3ZoUDJLRmxPVzNMa3lRMHlGSzE2VU05YUVJd3F0OFd4R1Rt?=
 =?utf-8?B?aDZSdGNJY3Z0M0lLTDhPWDhlVGdRdlZwZ1d0RkxzYjhqemk3citCcnRYWFZC?=
 =?utf-8?B?QjV5WFcybHJYak8zSnFqTVU4eTFHUGo0bDZTeDhpK3phVzZ6c2oxQWxJTDBM?=
 =?utf-8?B?YUhLREJHRmkrcjI5WlR4UmJPdHFSUzdlNWIrZVMwOHlGMUZmMWpid3lyYVhN?=
 =?utf-8?B?VXdibXo2Q29ZQ0RTaVdTaGxmQ3NyVm5xWVNzTThyaC81ZW1HNnFkdEhXNTBW?=
 =?utf-8?B?Q3VmSGlYM29wamVGdTloS3dkc3p2dWNsNENxaHZidkhQaHovbGdHaWlNQ2lZ?=
 =?utf-8?B?d2J3RjRoK01kVksyYTBsOWh1N1VUUFNnN3Q4RUlOazZwWDhuSm5WZGZrMDJZ?=
 =?utf-8?B?cDI1VnVVQ1J3NXduTzlTRkFGMUp3SjJpZ1ZaSWVDMHVxK2hvdCt0UWlzaWtv?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0b4989-3e1f-41b4-95e3-08de130e7788
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:03:19.0814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd41XqXeA50OHHcAckT9mFd3pmxckmw92vmrNHJq16PaBjpRVNY90MaRzZ6demSmuTBoX5PBPQSETpcvpsryyD8/qpUYulNyvrsjNiXyR5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7824

Hi Antonin,

On 10/24/25 10:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit 3061d6061e74 ("mesa: add opencl DISTRO_FEATURE") in
> OE-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

