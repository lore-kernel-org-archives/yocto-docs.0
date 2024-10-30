Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BB0D5CC88
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:21:32 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.65])
 by mx.groups.io with SMTP id smtpd.web11.11588.1730283681842104067
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IsWhu2Rf;
 spf=pass (domain: cherry.de, ip: 40.107.103.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSefXNrhS8i+SujSDuijeprd4NJBGCKHU7lG3aEEvUzZFNXVzi9Cy/I+UJSj+gj6oqwDVE5R9332dW3/1nkStvYVJq1I/agkNVma8IfI9hm4D6AovTzIPzyIS3SAXD1Rkh9QLP8yMjs3bmA9XnrAWxu/SQ8ktCQKFjdq3jb9jjk7AA2umsgqp1ygnRAcndR/o9IiiN0IMXPRQ2jNQaZb9av6Fcn9kVViM23zEvnlVuln1VYkcQkjfT4D3ORM9e484SZWb3ZzHlxhyyeapi6KEnUfPQhtcUt3oEfXFepWez/Aps0L82FyVQwO7nCAUkfLTrSr2T78gdCp0V2dtUtovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aPvnFVQelbqYeGVD6U9APyX+jdrin9+zLU8abkZd2o=;
 b=jeg4hlgIEYEBzZyF5+11BkCcorvv2EiKXERm8eH3FpoeWUyRWscjtsiKnZofuc4z+qhLDWFMTa7vnh45p02gK+2yKXww0Ark9WXQDUILkUiXltdCOUBoJ9qXGJH6R1aiYOjOATPfQBcW7/Vhi39tiErhoBF/dZts/VXJbzSfwrzQthzXwI6Cj9Z1uYB4OogTyPz9++ZWDMxevbxjS2nnaqNpZuI1rep6a0qCwbSPwYXj9Fi+6xZZ4U/JUXkWP5PjcoLHLZPCNibKf+zj3P8NtHnBQ43d9x/AjK4r9yExuPv5ASvv5nswxdD0+zVS8RJ3i2Z4BXz8GFXK+tk621DQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aPvnFVQelbqYeGVD6U9APyX+jdrin9+zLU8abkZd2o=;
 b=IsWhu2RfvfNVIRkX58dnjN6Zmuiw3BUfI1ej5VkP9vdwXSpLunjqDAKedj4WtVVxM7m71S5ENAK+0TVqbWt2FS4svjB1N7YhdhkQWFk0Gwnp20OkK6JKCceTP34gxf9V0/pFRWYel9wPsAdvrj13gmguxSHN0o0e26uigHGGPb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 10:21:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:21:12 +0000
Message-ID: <502402c8-3d16-46b6-b0ca-d2b8d92fd9ff@cherry.de>
Date: Wed, 30 Oct 2024 11:21:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] conf.py: add a bitbake_git extlink
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241030-layer-confs-v1-0-0f7dcf460e27@bootlin.com>
 <20241030-layer-confs-v1-1-0f7dcf460e27@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241030-layer-confs-v1-1-0f7dcf460e27@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 33abb045-99a1-48f1-1124-08dcf8cc9422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZHltbGFJUjNkZ2lSeDgvSENJWFhHRG5QcW9oYmZhMGY0WkZKU1ZGTTl2UnA4?=
 =?utf-8?B?b3d4Uk1OMWhtUlFIVHhmTzRNNXloK2pEVm9LZzNYMnZ6VUgrTDRYWktqZlAv?=
 =?utf-8?B?a0FBY1ZIVTVJb0NnV2xHQVdXY2h6VmxJdkZtd2I2RVE0ekNoNE93cUtwUGJU?=
 =?utf-8?B?cTFwYjV0U3BTenFUTElTcjV5V21HeWlFNVRzTGM4ZDBsdjcrZW9nbiswUVJI?=
 =?utf-8?B?T2dPZTUvUVV6R1B4NFJqeFZ6aS9oUEpYNlRaa1BYeE8rNzRrTXJWMUZ5YURi?=
 =?utf-8?B?cFh5YjJmVjZXcEcybEd5NVdJYm1uRTliZTV6NWp0ZlZZWHgvT1o2YlZDN1pk?=
 =?utf-8?B?bmJYV1hsUkswY2lWRDE3ZzBTMG5Ja3pKZU1YOG9MS3Nnblp3czRTVEVwOFBq?=
 =?utf-8?B?c2RYUjZxb3VSYmtEZi96ZkpKVXYvc2x2eGRlV25HRXdMUGFHSEM4VVhOYStt?=
 =?utf-8?B?RzdkN2dNSlluWll1N3hKN0s4SzJFano1azNFaUVWdFM2bmY1Qkt4YmR3R1dP?=
 =?utf-8?B?NEorMFkvRWhoSjBUVVh1akNwdnVLK3ZCVjB4R2FjVmpmdHhWVEZTUTdJWmZs?=
 =?utf-8?B?M0o2RWRZQ25sbElubm5CRWJab2RWbzAyT2FrQkFUNUd5ZVNjbXhiYnJDMG5q?=
 =?utf-8?B?cExsbVpTc2ZoQzludE10Vy9oaktvYmUxUFVKSHpsNFZmclRxNjhZSXhqTEdT?=
 =?utf-8?B?K3pOWVlSZ0xubVZBRVZTWlpWblZjbGc1aFMrRkJzaTZFdk9NRXlGaEdyUEFM?=
 =?utf-8?B?RG9tQTl0UzF0U3RHMUprYXhhSXFveHRONWk1WUpSSmJoQmFpY1NJMEtaM1Na?=
 =?utf-8?B?N2FpQXFqNkRaWm44cXVPZ0ZFczJidmRXU0s2aWY1K2xTWXhOR0xFM3RZRzVv?=
 =?utf-8?B?ajVETzlMSGdDUTFwejU1ZkIvWWJWUHB6bk1qcmk2MGc4QnhnSmV4L3hsMXh2?=
 =?utf-8?B?YzJQemU3QzVrMnQvTVNyWkI4K1kzOG12SjVtRE1IMzhmZE8xYzVKTVNqdXZZ?=
 =?utf-8?B?alU0N0V3OW5UcHRFRFQ3dVlJcSt6MDQvSmwrYmxSWXJrSmFwMEZZSHlUV0Q3?=
 =?utf-8?B?Y056eEJscEZQQ1VOcDBzTW0xRTFBa2pFZHA4eEdkNy9FSGtTbWJSM1dIdm1s?=
 =?utf-8?B?bjhkRXUvOWZ2V1ovUVVJU09YSmVveWJQS2llOFZzZkNlaWJhcnJEVWRQWWd1?=
 =?utf-8?B?WW1TNjlzTkR6SjdWRFVwRGVHUDQ4dFJYdEhKd2hpQWJIbmxYSU5PVmpVc0Jw?=
 =?utf-8?B?Qm9ESVg0OWh6V3YrR2lwaDduc21sK3hqYitDSnJPUGptc0RzVlhCcExHM0Ju?=
 =?utf-8?B?SFB0NDNNSFFzZGZqZzVvaldJVkZLc1hpcWFma3hDL1RmUEwvZlJiUzZweGlJ?=
 =?utf-8?B?VTh0QUdwWmxBN045L2pDem85d3hva2tkcnJEY2xSODQrdjRUbVd0OWlzdng4?=
 =?utf-8?B?VGcvaDFwNjYyN2hTQVh4OUlIQ1ViTzdTNTRjQkNwdmdBRWVkNGFBeFZ2ck1S?=
 =?utf-8?B?SmtSVmZUc0IyWG1hSUkxcDByeVhZWVdtZzZ2ZExpNFRzMHRKZUIrQ3RHYUNw?=
 =?utf-8?B?QUxsbUh6M1hqWmEzM0pnTXlmY3JQNnM2WWt4bFZpL0dBU29kai93cmhqajJD?=
 =?utf-8?B?eG9ZY0JWbTU3ejJmamZadEdIU2tyYzBMY0g4QTIzZWYydUo5dFRsVWIyM1I0?=
 =?utf-8?B?VkltakRLSExLQTk3MTRxTjNaOUJ3QXpsNng4WkVsb2w2VUtQTGtab25RVGJK?=
 =?utf-8?Q?SSa4FwvJsRPc8Mm/YrOODPwtfyWZ1yFkAlF8d9k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHdiNmE2UStUWlRJKytmRGVhV3JQcVBBWmxQS3g0aWhaVG1hVEFubi9qRE16?=
 =?utf-8?B?NXVmQURYbFloREpKTTduSHFaalkzYng3V052S1ZNZWtRZDNURytFVVdXcmI2?=
 =?utf-8?B?S25mbmdkWUFqT1o2ajN1ak9MdUkzRnlyVjZzQUZTcUxlaVFmaUkrck1EMFcx?=
 =?utf-8?B?dDNnYmFWWXRxRlRyWTRCZnpETzRXYTNSOGVqVG9BS0lTNUxYOUxjOC8xWjJp?=
 =?utf-8?B?OWc4WUpJRzlZaTluT2FuNmtidkhwWkdOUmZESm5pS2dwL1Rrdm1sMkhVTTVF?=
 =?utf-8?B?emZzUjdGV2UwVlVyVTlWOUdRb2IxbkRteXUraUg3ZDJnYzBmaXV6amZuVW1x?=
 =?utf-8?B?citMcWdqU3ZTckdzdloybHd0b1RpZ2d3UHo2bzlJanZEYThPMUJwbzJEU3Zi?=
 =?utf-8?B?emc0QUJpRzFvV1NqaER6M3dkSWM4SlRzSVd4Q0N1eUo1NTkyYnlOQUl6K2NM?=
 =?utf-8?B?WDQ2TU41clBFOUpIc3UxWFU3dklxS0thY3J3MVNQZXEwZ1FXelRpNzUxS0x2?=
 =?utf-8?B?eTc1RDhTb1F0ajJrb0dJWUdsM0tiUDBzVGx2MHYyZUlvSXdtWlFLZitCbXow?=
 =?utf-8?B?V3Z6NEdHUW5PVnhnK1RsRnRsbVhiQStJR3piYWltSEZXR1N1dVgvejlBdHpo?=
 =?utf-8?B?SFRzZU9tZis3ZVQycWtLYng0R1BXMDloVjVCdjJzc2doSExFdFNEU0RxRnRW?=
 =?utf-8?B?dERTV0RBc2YxT0R3MDJsMFdEanFvMnNOdFNyQlB4ekZnL0ZXL2hZdmNEVGcr?=
 =?utf-8?B?UGxhT2pHdW1CSFpzL0UwZyt0blVIT084akJhU1Nyd0R3cW9iT2RqWjhsOUNC?=
 =?utf-8?B?N2tQd3p1Y2I5NS9XTkp4emx6YXg3UHFRVVRIZ2NzZVBLdXJEcHZZbkU4NGRD?=
 =?utf-8?B?akI0U2hDUUtUK2U2RXFuWTlZckw4ZVdMSFkzcGRNU0NDTk91TWNMYzJ5YTRo?=
 =?utf-8?B?QWRTSTNCeFNSM3I0R2o4MGJtQVNPWEowd1BLVllpSU1CdlFKTEt2dFFUS3l4?=
 =?utf-8?B?VWVUSzlZOXU5K1RXUFRMVVJxNlVVL1lmUHpDa2ZabVZpTUxOSngzMHNQTmhW?=
 =?utf-8?B?cFdmcCs1MzlBRjcxZ0llZm9SK1NpYnNvaW5XKzg4Q2ZKTS9YR0U1c0NkTVRx?=
 =?utf-8?B?WXFUVklMUUlDcjl0Wmp1eC82aWRtUjIvU0duc0N4cTNZemp3R2dDdFNyak0v?=
 =?utf-8?B?a3hsZG43UzJXUWh1ZFI0Z2YxbWVYNVJjc3ovZytlRDVvYnlSS3hDWmNFK2Ez?=
 =?utf-8?B?dmgvZWp4Y1JCMDEvMVN5bUt4MGd6ckhtajB0d0dJQkxEelRVOFZodEVma0xr?=
 =?utf-8?B?NlVZbTl4NWhCQUxNWmJWVmRWaWJhdVQ1K09jMTVkVE1ORmpsOE8rWjdBcjky?=
 =?utf-8?B?WUszV1lnRW82QUptTzN4Z05SS0lmOVIzTGlKQ1FXdFZJcUpRVDRUaXlTMDdp?=
 =?utf-8?B?RUQzUVhOZWZUb1FubktKY3FtU041eWp6WmNwQ20wVHB0TUo0WVg3TVMyWUUr?=
 =?utf-8?B?OUN3eTNRcHp5aDQxL1A1R3lFZXJUN3AxeDkyUjFCWUNCZ21uRGJhbnNQS2Qz?=
 =?utf-8?B?RUFVeFZKRmJLSnJsWmpGRFUvdHNHQlVIZm03cUJzR21Tb0prZkdrN1gvYkhE?=
 =?utf-8?B?ZGhyV2JqdXR0WkVyazNrNDRFSitmSEVPYWlZaVlEaWdSaUdDOTlzOWpXQzZH?=
 =?utf-8?B?ZTRXc0drRTVSMXVmMHBGUTNmc2dYQ01BNUc1UXhCUFRqMC8rZ1pEK01pL2wr?=
 =?utf-8?B?ZHBTU2JwbW5UUi85MmhvYWZua3dEM0NaYmU0Zk14WEU1Tkw5VitzaVVVWitW?=
 =?utf-8?B?UTBxRHcyR2JSTFdPSkRTUXkzZ05ZL2creFRMK01kRFFjMUwyL0lZbjEzcE1F?=
 =?utf-8?B?N1lWd3ZmQ2pxTk5lRVpMOFlFNmdHYjI4YzNoV0VuZy9Kc2pHYWZ1YVJIWnY2?=
 =?utf-8?B?SjBZQmpIYVI2cG5kRlZKNThZNVNBRU9ZdllMUjJ1QTZ3VHlsOGU1c2YrQ1Zj?=
 =?utf-8?B?Y2MyZ2NhTk9rMTB5dHgwU3BRSUVDQ3FZUmRSeHkzZWxxN2hNVEJYTlZWZkFj?=
 =?utf-8?B?cU5VR1FEeUF0c0x2VkJ0SjA4dWR1b0h6Wk1BN0szYXBYWkR6OFNYdFVwckJL?=
 =?utf-8?B?RU9PMGhha0l0R3ZzM2ZnOHZGYko3Zkc5RzFvZ2ZLTFdrbTZMb2lQQTRNcFJE?=
 =?utf-8?Q?x5WNGclrmgkoFVhzWPEsKuA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 33abb045-99a1-48f1-1124-08dcf8cc9422
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:21:12.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTKES4FCYCfwjn8vvVEVsEeQLndUTyOPIiyodTuy01hHsYT+qrCYw5J7K96/M2Dny8r19LrbvnuWDAA2pOAERqiMWNw286SFHzx8P7XKDrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:21:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5617

Hi Antonin,

On 10/30/24 10:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> To make references to the bitbake repo, add an extlink for it and use it
> in the docs with ":bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`".
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I believe we could also migrate a few oe_git to bitbake_git now across 
the docs?

git grep 'oe_git.*bitbake' should help you identify those.

Thanks!
Quentin

