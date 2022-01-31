Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C5C433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 09:21:15 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.69])
 by mx.groups.io with SMTP id smtpd.web09.30036.1643620873412711368
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jan 2022 01:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ezN1mFWZ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.69,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ci8WtOK0ZhsDRGfOBGzE34qxFk6DEXlkijztAOlcns+KL9TxQ74voHaZu5AqeVzpmUVkhxk3wXJHhVH8vaYGO91TX6taTeEq6LlPwFPgQ9Iq3RRuFh1DV0iZ2sqXPfmMv8OmRmo50GpBSyzAeHxYWewSdFFmfjWiAPhPTzU5eIPZapruu/AxzSptvKvfFRvGxspiFUewptcFsheHlCN+buEcibFOp8BjKLIAZ+YRzaeBrVhDygusk/pSEH7cXHVnxcymuZsenp8pQDG1yfWwfFsgjyfT4L/0DILxfWtuHd6yni/ayg8Yo//74V8bzQFmOHBaQ1BV4umOTjnr3gJMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPStD8rURFtivqImw3xXHOabNlFwEMdrh116/vfPBU0=;
 b=iVQD5vYFvCsdi+alW3zl6Hdar4D2ZTPnaG5yVAJYqO9CHwUx96HFFw9wVc7Az6treD/M+F3F8PG6NbqJGBJu2ccCC4ych/rgHnIUTHO0oMI1k2U2yvYuBn7m083ciWnjLuwtGXd9meQehA+e88pQgbr3BhhwuVxRYztKthJ03Kc17LyI3nKXyczy7Dw9PhO9Ag2NsSWluiaCQ+4uRQNnE0InvYI9KDhEDX4QLTB3Al8pf+8/CZR9pWcPQUJJivpR/ewT7K5TYALpMHgPnXNlyr67UrDfuGlWaDcAchaf3LxRa9AUen6euiXQpb2t9uqqLNao3NzsAMFm5LkeFzs46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPStD8rURFtivqImw3xXHOabNlFwEMdrh116/vfPBU0=;
 b=ezN1mFWZBaymJhdoJB1dt5AZR20MJ0PJM/LO1Eo2ibG3zA6gSUwzIdZHoVRmepoaikkgezCvaSoaldsVmmjUyzrkgJO2koFtBizSSOBdtMMjNVgmlf1X5zeWRMkdjuoir4CljZU3jhLdSD560qbCC5gIR86aMGom/I/6KXalD7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR0402MB3378.eurprd04.prod.outlook.com (2603:10a6:208:26::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 09:21:10 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 09:21:10 +0000
Message-ID: <af2022f8-aa08-9bd6-5769-d92e43871522@theobroma-systems.com>
Date: Mon, 31 Jan 2022 10:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH 2/2] test-manual: Correct two references to
 BB_SKIP_NETTESTS
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 docs@lists.yoctoproject.org
References: <20220129022602.17304-1-pkj@axis.com>
 <20220129022602.17304-2-pkj@axis.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220129022602.17304-2-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0033.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::22) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161421bd-9e84-483d-4025-08d9e49b049d
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3378:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB3378E7F5511B74F9BCDEE1F8C2259@AM0PR0402MB3378.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iGzzE48kcMErV+ICbCYU7mSOPN6NjXheuIJ6gClqb1Q7p5aTKADQu2RwpVJ0OpzSsjfvAPEkkJ0RtptVD30cVuAcBkqsBJDVfXv9HyPgl4nWOsd9w+2clJf9pfN0oWNbWop/EG7Bl0TdRk7M3c/1wAant2M2rNLRJvG/rCEpItg68/4SlA88gDRoDLWjZBVYcrFnuglUuIoSYhtXECtc54eYFU5RBYurfwVx7Di0tfmhT6etfngDtrNPvkgBXXzc7svTUQ7kvaS7g5lqtbDz6MNdZuSXQOIQ9QD8YRLwu0FU/V5C3MA2iREUiRgTDrKTkmk1Ly/mMWusDUltDMudR5IVQcOwCWy0Qndi14956dkl2UpnKtC8kUOYGxCw/vbBXm6I8AX9ZZGLBzN8gyQt42GHLqC8gv9ysWtDJSxjfEs43k2AwLHDlpq1F/rWjyFiOWSu7dYc4aTykodzKdAkPGr1Mxu04noQjwpcayj3B08Mlsc8YvbTLS3Z1EKIJcUyahMlithr/ZcUuvatCJn5eQ9aSph2o05noBE2zQY9pcsYQVnNMMiCW3Ib2roAbxOgrui3oqV/iD3nceR+uDOstLmnpjLvI7v3ZEfQqODRL6QUkQXlwOMJYMDH4vhmi/2o5+fhqncQqaw26OvQyaatV7gxrtfoGukDQGqB557Ea1m5X0t5YTCndylJQ2FoFeclzv9QpxblUccOamkDx205YRncJLu+9Z32S0SvtoDuLjA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(508600001)(44832011)(53546011)(4744005)(316002)(6666004)(186003)(8676002)(6486002)(8936002)(86362001)(2616005)(38100700002)(31696002)(66946007)(66556008)(66476007)(6512007)(6506007)(2906002)(36756003)(31686004)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VndBZHJCeXoyRDNRV3VmVVVsSlRaYnlGOFVUUTI1QnZUVE5HalJick1PcjNt?=
 =?utf-8?B?K3ZaSXBoMHZBY3NmVmNTOEplU3RNWWh5WkN5cmhLUitwekVmN0o1NVhlOHMr?=
 =?utf-8?B?dTVNZ1ZlS1M3MkQ1emp6anFyWjNYSGx1ekcrekpYdG9NZDgwYjcvdDhuZTFu?=
 =?utf-8?B?K05xOGQ0R1R3UWFzcVRJMk10QlFsRW1aKzM1TkdIYVE3VzM2L2JBbCs4QkZu?=
 =?utf-8?B?Z0EyRXA4OUNpUE1IZUNiSmI4REIvUy9scTBYYXpudmJGQ0Jqd3dPNmhEamZX?=
 =?utf-8?B?bFg3bHFORGFUYmNDbXdvYXZTL0IxcGZhR0hWTWVvRG0vZmJ1SHM1YWYxZ1hi?=
 =?utf-8?B?REhvUnlqMUkzaktvTVUvQjNGWVZYbnNhVm1mNnQ5VW1KYUduN1M1VlU3cUM3?=
 =?utf-8?B?Z2ZvVnhVOWJGTjgzRm56Q2pncXY3a09GMHFjc0drVDJvaWJRZnJoVjVTVXBq?=
 =?utf-8?B?ZHcxQk9HdHE0bGhYdGlaRWIzNUZpdFNhdnI0VVNXM2ZKcnpuN1FheThYdVNy?=
 =?utf-8?B?ZFVzbWk0N0JsK3Fwc1gxdUtER1VoNzU4UkwwVjhxYU51Qnh6RUdwb25jYXA1?=
 =?utf-8?B?ZVN6TUNDbjJ3d0tnSWR1QWhjMXJFRmlrYi9IWWRmMllnRHlRbUhQM1lqMTBa?=
 =?utf-8?B?SDBVc2o1ZEtoTnFNUnlWQVBvYVN2Um9XTHc3dmU0MDY3ZExnNjYyeHBBTlJH?=
 =?utf-8?B?MkVVdWxkVGF5aFBzVkg1c1cvZFJWcGN0d1dXVHM3NWlXc1MxNHpTMGNjVGRX?=
 =?utf-8?B?ZzdaSHdiTy8vT1JmQ2JHQVZiUUJ5Vy9BanVxajZwejdjVWhjNjcraktiWDgv?=
 =?utf-8?B?OFJKV1Nlb3VYbmlpVlNPVzBiUVlYNERwMUV5NWJxY2tVMkFDZ0hOQ1FmdDB3?=
 =?utf-8?B?Y1VHZHdBL3RoM0syRXBSL01CR0JIa3NHMk4vK2dEZUdlVHhOYy96S3pJSDBh?=
 =?utf-8?B?QUFPMDRzMlV3R1JkMGhxVUJDTmdHRjlKbmVpSXBVbnJBdUNzcnRiM1lFZnE0?=
 =?utf-8?B?bmcvWFVmYmlseVpwMGhmam0wOERIQ1M3Ym5rQVRUQ1VMREZ0dTBZV2Jodk04?=
 =?utf-8?B?RnI4RUpsdHlwV2NJRkpSUExvczhjTGtTbmVBdEJFRnM4dFd5QVlxRVlEbHVn?=
 =?utf-8?B?bHlIZzhvMUtIcXVuNGZ2SmNIM3pQZmZqdmdkU0RYU0lFU3FPNWQzRDZWaW1K?=
 =?utf-8?B?ZE96V3lsWExtaEFPY2s4LzJ4UlJBNjR2Yk4zRVJQZGdpQzFzRFIzQlg4aWs1?=
 =?utf-8?B?Ni93dVFORUpnbTlnWjI1V0lDd3BBaHoweXgyaENWRVFJUitTVkdrODUyM0Vr?=
 =?utf-8?B?UTZWL1VoWjNSTDRPWEFTdWpJV0NDSlZYSGluaW1RM1BJUkpvWU8vdWZwaDhG?=
 =?utf-8?B?V3ZvMlhZL0hLeVhJanl1V29xZ3AyZmdDZGdHdllVdGFBT2VaRm0zR21kd3VK?=
 =?utf-8?B?QURaVlJNcEZtOS9CY0ZVazB0Rk1QOWRKTDdZbVo4Tnl6Rng5UzJMQ3ZQV21O?=
 =?utf-8?B?YmNzemRUTFdGK2lCS091aGVESVlMeU5nWG1ob1MvaGIwcXVZY2pKQjRaT2M2?=
 =?utf-8?B?MXNiaWVvZ05MN25QT0ZWZDVleWJub1ZZekpGejdhWjdZVWIyS3dXU0tobUI4?=
 =?utf-8?B?dVY3WVNzeVNDVDNzUFNkcFlEcW94dUdDa05nUHJObnlMZ0FCb3hKa2ttODV6?=
 =?utf-8?B?VGNJZUtDSHl3K0xtbHdPZjRWTStHbkc0Y1A4Z3ZBNGRJQVhHNStaTGVxYWlS?=
 =?utf-8?B?ZnZTQTFCN3o5d2VkcnZZWHdqWGV3ZEdRaHZKdE1mRGFqOWJhb01wNTUrNEtG?=
 =?utf-8?B?M3oyUjJXc1U3cmV4cFd6cVdnM3ZvWUNBUld4bUJBUG83U0xUV1hWZDVuYTJp?=
 =?utf-8?B?dVg1T3lVZUR3VjVrLzJPN1JyNGpZK000UFJ6STg3R3pMdnRpclBqNHlYOWsw?=
 =?utf-8?B?dVJtRVRhMjBtWWdjREJXTEdaRHM2YWorQ2I2VlpuUGFTdHdnOGNCbDhrM3F6?=
 =?utf-8?B?MEIyMmlXazhXR3g4ZGg1T2p6VXAxbWhFQm1oYmE0aERqdk5pMGZNQ1BpbTAy?=
 =?utf-8?B?bkU4K2VFaTVJUDVYamNkV1ppcUJ4b3hyS3RpOEo1dThCWW9YV08xakllb2JT?=
 =?utf-8?B?QnljTzUrb2s2SVpndXRUV2t3cEY3a3NZMkU5SjFTMnR5UXhFNXhHZ085Qmlr?=
 =?utf-8?B?TkVUWFdZYjZqSkljU1pnRkVYbjErcURGK2QyaGdseTVkb0pMYitONG8xSnZS?=
 =?utf-8?B?RUh6UnA0ckpwMFZRSHNXQk1JRU1iWDBmZllPeDlWcEhlaDdzU3VJTFdCYVpU?=
 =?utf-8?B?M21qbEtJOHd3VmhBUDFOMlBTYllsZmhqWWxrWlJBUFFjeDVzWlhBK2lsRTFY?=
 =?utf-8?Q?L5REkFQnN8j9/DE8=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 161421bd-9e84-483d-4025-08d9e49b049d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 09:21:10.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wzlRAcDvmsNPyKTACO9Wl9ly90jZJaShyF4Y+dbONhg6uVOLRqwi7Hx0IOejuExwJLsbbqxCVcQC2oo/EruniUKkUH9jDdtwDxDv1Vb68E4jvhW+yOO+PC8Ntp5PXNfy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3378
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jan 2022 09:21:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2455

Hi Peter,

On 1/29/22 03:26, Peter Kjellerstedt wrote:
> The environment variable used to disable network tests when running
> bitbake-selftest was incorrectly referred to as BB_SKIP_NETTEST.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Nice catch!

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

