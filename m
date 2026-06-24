Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32ADCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 10:42:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4051.1782297715209379488
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 03:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=K4Ep61jP;
 spf=pass (domain: cherry.de, ip: 52.101.84.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghFIJ5x37AHoNVYE9sF9Kv+MDMkajfommDFKHsDx4Y/6cdCAA6vGFy5dqVKcZNk+ipUvf/vdOjDVGxY1Rci0/eIrEBv66pYFAtDYp7DCm4NFA7Bxd6DEeTpFlxHjw8nK+7a5XWdyeeRRa54aXiTaPsDhuCoHgyi5FeB2z5MtkKbiglK+wnN9/1iGGmxkJfANqBBhh9IKOcoNwnpb9EmjN5DogztAo51H9nz7GCVstgFiBt3d7I23rwZzllzz17f+v/L4p79dmhIjks8qneVNgcuIynPB+aNr/vrZdBe7TAs8dn+91WNvb8GQ2bNp/9Z9/mT7Qlktu53OgBz4L52iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hOpkRlONVjFTUkwcAFYzdliYPhXSxpqbGIuhZHr9sk=;
 b=Hofea+VmQMCCWzahKkfBadjWSM9YCKH+yX87aSkN8pAiGIQVUR+oZPVgSGzWUEYj6uABtDmtJ97CVgRDems1yfWYiiw4okQIYrHno1PGr0NBv2KQj4E6fSWPS45qaZicfoGZseBM81eqVkRSL7I2abqBDXvmEOspGODz0WpB5KX9Jxx5LUJqgI8tzMe5iDm7TA96NKnmuyujYtsQzbZ0BE+s7EFuvo4d5zkweHG+8eeQCrVh/bUaTv790rx/pbgr831cPkN9zaIcfAPQu9UVnpEG4rwVr+TkfcWbRRy5i820Ezq+v6pzGFf5R/c41wS6Bkd5d9d7RX1kDsBzedVXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hOpkRlONVjFTUkwcAFYzdliYPhXSxpqbGIuhZHr9sk=;
 b=K4Ep61jPNBYppNopyHPymZUCObDe+II0dZTKfGoxtk82rEWFa8xRBF6qaWMgYKAn0XYyiwKijhqc5U2L71bitEQOX/tpobX1gDOU+oqK9JO2Cvl/bV6Hv0YUmQ485/tM/NJnq4W253auOBgoGcvGFIipHhAIJclMCw8V2xnaGIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS5PR04MB11345.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:41:51 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:41:51 +0000
Message-ID: <1757a576-11c7-47ab-8ca8-1dd699f485de@cherry.de>
Date: Wed, 24 Jun 2026 12:41:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: fix incorrect heading level for
 site.conf section
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <3996e3eb-bfa4-078f-1dda-e01536e65cc9@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3996e3eb-bfa4-078f-1dda-e01536e65cc9@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::16) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS5PR04MB11345:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8f191e-c3c8-465d-f482-08ded1dd3323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	7dyZ+d4NV4mUlryRZqTMduxlxgcxAdDkRe3BlHR/RbTlVFZQfXp8dPIVaCKEQcj1PucZWwAMgaSAOhZqCcBYQy6KSnlvdTuzsK+cM2j5+yXnJ1duxByc0+8yQKhoM4fHLNKJ8y1atzw122PgosrFdpL3UNbCWP2F0UjvkfasCjc9ZdTfrZ37U/5vKbWnscHrsfpVvFVWc/IDo6vinu/ffLDDx6cAWq2soMUPBKgFsp1ibkFKyzdzq7hr8rFF+JP7aIdXL7kZ8jqErhEITzTjmrtiodxqRy8fQZpLZvm5pz7jM3TCsDHYFXWcqa8PyVepvLULK6JWY1YmefABf1CW73DxsETmzfm6LCikl6p0v95c9/4p9+X9Qa2YFjya5zMHMYPB/QmiQcDQCHaoM3m63pi3JcFpww4TlrNVcaT7LnN7n24Xw8s8qPeFLU/05kmmStfPZZAJMemF4/pTMvs++815lRc2sdLB9u1TLIEwTSM+BevWbNwnp3qugLOyblpNa+EoCzWunWHuORQXeQPR1P7KD/nOTjpGDtMBSE9edctMEX32AILkgWcoKL1JU/ZQOEpC/1Gd/kjPW0b9R7pmMg10wo7wVr4uh5UpJCzZCjoWiL/WZ6Fj9afNE7l9FpimJyR07wkqLReW6ZVpTJAw03WOE7HKk3Joo8wkymmoMKM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGcrM1NMQk1qOFgzcDdsWHdpWnRYdlpRM0JGdnZWV0hERENsVDY3K1lHVy9C?=
 =?utf-8?B?Y1JMcllTWStuSkw4c3JXcENZcGRRVDhlUE0wcm5QTlVlT3VYazhJZkxNSTRX?=
 =?utf-8?B?QW9HUVJZTGM5RjNSVjI0RDN5TnNuR2pZVEttSlVHNDAybndFSjRkTldYV1RL?=
 =?utf-8?B?NGZIREdJRWxjbVl1ek5ySUNhN0hlOVc2K0Y4NHNMSHlXRHROU0d5WnhWUjFm?=
 =?utf-8?B?SzVFdWl5dzAwUkdyc0M0cTluYkwzQmFGVVNsZW9BYVhERFVBMVUyNDJCVGlo?=
 =?utf-8?B?U25nVS9FalhIRXM5SXVWVDI0czlER2pmN1h3cnBaVTROYlVVZEFVN1phS0l6?=
 =?utf-8?B?Ny9IVEJwREtXcGxzZHRTajc2WXdYTy8yWnEzODVDMWNFYkdtQVFhQ21RbjBo?=
 =?utf-8?B?anZsQ1pjTUhpOTQvUGdKVExKN1VaN2NJQUxYVGh4WFpybWJxbjFqWDRvTkNn?=
 =?utf-8?B?QW1UWUZXVlV1V1llME9sdC9xeTF0djhCa0RWSE95L1dPYWtManlacXFOUVQ3?=
 =?utf-8?B?WlBmRmoxZFA3WWNSVVc4SHJRV1NwLzR3T0c3MDRIdEw0N2VIMTl2a1ZuZ3lG?=
 =?utf-8?B?MUl0dTdmRnZvNkQ1a3Y5bU04Z0ZST3dLc2lhOE1ldHV6Q1Q2aXlJNmpNbVVS?=
 =?utf-8?B?eG1UWXZhQWYwWnJFVVEyVXNKbVhUc2IzUVAyOTI1OHErYUdRUWpKc3dwWHd0?=
 =?utf-8?B?S05kd1ZRdGxKMlVJaEdvU3Z2b3Z2Slc5bjlRTjZEUDhZSWtPTnNEK2d1WDVv?=
 =?utf-8?B?cHpKTnk2bUNTeGdIQnBBVEpVZnJtT2JpUHUwNGxtTk8rdGlpanZmRk9qNXZk?=
 =?utf-8?B?eDI5UGpQSDJwZnkrVGR1R2ovNEhFaFlwSkpXM3N3SXE5ZDRrQ0dVWW1PeHN2?=
 =?utf-8?B?Z3pqaWdnRXZ5bC9qRmlQOWI5VWtVZ09lWGMxN1RtK0hKRTB0d1hqWDZyYVRR?=
 =?utf-8?B?QnpyL1hHY09uM05LOHZ5Zk5QTk5PUHcySmNvK2lYeFJDaHB0d0hYM2FBRHMy?=
 =?utf-8?B?UllrcHpEbGtPVzY5dytWZnA3cm5aeEVoZGdZZ2ZSaW9lZ3k0bjJ5ZzdYZC9z?=
 =?utf-8?B?L0dYRy9zTWtKNE01ZkNRUmV5Rk9PTzd3eUZNY2xBeU9PR3haWlpiN0JlaXkx?=
 =?utf-8?B?OSs3aisxRUpNSlRpRHhNbENEeTNpRURyd25ic1VQQnMzYVpzbEY5UFg1bDg3?=
 =?utf-8?B?bWVrS1lKYnVvK2JqY3IzL0E0WEdrMGNLN28xeFl4MVpSdkxrQXBuMFpyVHhG?=
 =?utf-8?B?RUx0K2VKNEVNeXhtZWtGUmhrWVlxRkZ4RkNWQVZLeEhWZFZDeStNQ1RSTmZV?=
 =?utf-8?B?NER2KytuK0MrRHNicTFzM3ZGR2pUeEFZSEFwcUVPREtPMGl1MUxrS09pdHIw?=
 =?utf-8?B?OUc2dEJ4YnY4cTRUcFk3eGZSWEJob3Y0QUYzMmRwcGF4VE1CamF0QVNuSm9k?=
 =?utf-8?B?aWpNT2ZJMGNjUEo2QlpNdVc2S2JNQW5DQWlYU2lrWVluMnJPTnlQZnRwSkw1?=
 =?utf-8?B?cm1CbmVoMDFWMVpDc3BTNXFIQTh1K0FSNE5TazNudzlqSHEzS3l1dWR0N1lE?=
 =?utf-8?B?ZXI4d05xUGJ2c1BZTTlnaFdlWDZDVXlPcTQrUXM3NU90YzJqSmx4ZFY3dVgv?=
 =?utf-8?B?R1BJUnlrVHUrbHJOLzhDdXNrUzN0MWEvb0c5RVhVQWpOSXFVemo2RWNWOWk3?=
 =?utf-8?B?WFE2TkhlcjdJK0NGUU5LbUlHREZEUU9NeXF5dlZwaVNQNUlGZU5KR1pNb1FZ?=
 =?utf-8?B?V1BPVWQ1cTFyWHdlYVVVRWg0aUFwNTEyUTB1ZWJCT2lDYlB2V1dhQWFwV2Ft?=
 =?utf-8?B?cEZvL0ZSNU51VnRuempHWnFIc0tMS3YyMUV6QjBrZkRtS29QcWUwbnJMODlK?=
 =?utf-8?B?SVFnVmE1ZGxEY2k5Q09JbUY4TnJkckJXYjZPSk03cGtxNVlna1pNWGZBU0pT?=
 =?utf-8?B?cUNmQmlBTnpaRi9NMUo0QWtZNURFcStBMjdjV2d3ZzZtVk5tc0ZNWXNSa3Zm?=
 =?utf-8?B?TnBHRWpSOHB2eHN3TTA4OURUWU5KVUpVbEdNZWVtN09aM0JMUTFKNkQzTTBi?=
 =?utf-8?B?OUh3OTRRRlhjaUFzdFpjaDhQY3ZIUy9rTzBTNVlzNFZybndSbGE5ckVHbklE?=
 =?utf-8?B?WlNENHpYbHBQM013NlpzcG1sTm9DcXl2RWY5QUJ3ak1hVldDTi94bjZyY0l1?=
 =?utf-8?B?cVlGL0VEbC9taGdHTnhuSkEyeEhGaVY4dGRDUVFkSHcvTE84SkRRQ0dkNzNY?=
 =?utf-8?B?K2RSUlFzVmxUeGJkWE0yWTM0dzkrb0VRSVhEQS9tVG9YSXByaTNmc3kxYWwz?=
 =?utf-8?B?cVFVQXFyTTNocllmWnovOE1BRXA2NGtzZE1TTkdYc0FCcUNqZGdoUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8f191e-c3c8-465d-f482-08ded1dd3323
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:41:51.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVPPyGEaXF94ud49grxYj1dLHhjDbdMyQdfDqY4SBqeSUjoSIKo38aU1r7q38DYRmPWu6athwqI5GcAX+WDInHIz3DDBVTtpD3pMHt49dzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11345
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 10:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9858

Hi Robert,

On 6/22/26 7:11 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> The section level for the site.conf section is one level too high up.
> 

Good catch.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

