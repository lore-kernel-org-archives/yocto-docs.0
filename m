Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63CFCE7D03
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:42:08 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.44])
 by mx.groups.io with SMTP id smtpd.web11.77465.1727775719942056087
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 02:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aZVjcafq;
 spf=pass (domain: cherry.de, ip: 52.101.65.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VincKhUeVQ7HnOZ7Q0vGebs+dsjIlCaHH/mbtDjZ3SVhDgz5bes/em/cK4JQUcWomuboDNq3K65aJ345+E3ebl/3MjUvuAU/I8ygPNmtlR/idK60n7os6EvSakFi6wWNyH09u+Ogs/q23eHJA0ZoFlX71hzDc9TuJb7vgB21itOmjUwPeWrxxGEE5+RX0HEzv8a1enZHimVk1y35n83Y3UjHlBn/YPwfY+omI2gm+TtTWsk9s5YBQ+FP8hl/mu6Ug/1VJECkTD3yU8dygRQFQ9i8y7R4mFPGXl60PpGthlmSbAXbIkKpi/Iv61If+F9nV0FWCJc8qtStFxsVLmslWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/aaUNU4hjmaX2W8Nb2VheL9LgCUMYuP6IoSmxIfJMk=;
 b=OSQYQM5rVWOGWHMYgWceaD4tpt/SQq622wHq2VybGANXceINbEbUwHb19InkhgXd2SDJFeMg1EnE7dMfgYM9aAop/kwx8woHqmYNrPmM+S5pcO9ywXZRcCxMu7x4HPikVBo5mMYvABKUOti6Pikp5TKQqK8Qb5rWADjHyfVeBYppWJWsz8pendeg1dSF6Do5P2n7FkLmKawFNW47AB/e2RE6cvnhiP4NsHE0iSq+5dxp6JFT+rgDp/xp/pJo01+4kTXWQFVG/30o+MO0pAz5W1B88UMd6uIqROcmLBecOZBKJhSEXHeAOalnknk+9gjCtglLix6OGdyqP+EtCDqwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/aaUNU4hjmaX2W8Nb2VheL9LgCUMYuP6IoSmxIfJMk=;
 b=aZVjcafq1S6HBAIZU3D25wRbaEqucMKCNdFNomZnt6hO9Q7PQDY7CcKVQMUR7vqjY6RHTSNwWC5jrg8eqs+QCQBtlFP7/g+ZIESMBwtYosh59dpKCNVLK+qybju44XlDTzeh1Kx/n6jy9HUr9UGjH/6mf5TIj8S4xUvmG//OUOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Tue, 1 Oct
 2024 09:41:54 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Tue, 1 Oct 2024
 09:41:54 +0000
Message-ID: <154dd858-5725-4966-84f0-835f86388119@cherry.de>
Date: Tue, 1 Oct 2024 11:41:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 4/4] release-notes-5.1: document spirv-tools
 reproducibility
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-5-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240927220033.3941455-5-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::15) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2a3e28-5d83-42c8-1b52-08dce1fd48c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1hqTFpzcDYzblhuUXpYemozcjZIQ21WTTJNQ3hEc0xicmJNbTNhekZDRVhx?=
 =?utf-8?B?c1ZzbG9zN1NMSU51ZDBGOUpialVTb25JQ01tU2pLQ3VhdmlLVk83S2NraWNB?=
 =?utf-8?B?WTBYUGllM1RLTHJIQm5wdk9US2FnRmdxWENDTVAxTUtXR1dNYVJrNkZqK3RZ?=
 =?utf-8?B?WlF0bnpuWkFYS1pOcHVvQitSamdaUTQwOFA4WEc0SHlzZE4zOWZEK1FXTndo?=
 =?utf-8?B?ZFNqQ2hyOUd1NHQ5aUlhYzdBZ3lvQisxRWxXR2RvNWdWQ0J5UmhPMGxBVkxI?=
 =?utf-8?B?eVh5TGtEQ2JGYkFEc3hibWFoeC9pOW5ydXJrRTVvSFRIbjhGWVRBaEFiK1RI?=
 =?utf-8?B?UmNaOHRrSjIyTmh2V2xtbkxoM1hMNndZVlJwMVJJU08xT3JyK2FZMW5qbVBy?=
 =?utf-8?B?K2F0czQ5SktCVCtmaVNRR3p3bEFielh5UGExYzZYM1k1aUpsUzAyTkY0aTNQ?=
 =?utf-8?B?MHpXaXJNMHk5OVRSQVlzQjUyemVWME1TSHpPak1PWjBxS3JBQUtLWmZaSEpz?=
 =?utf-8?B?S1d2cks0bWlOdEYwQzBYWjZYUFRSTDM5K1BpenRBWkc1ZjNOMXBzanRpNklW?=
 =?utf-8?B?ZzRyclRvRWlxMTNNemxYRjduTXNMSDBqQ3NPMkpkRHBOQ3RRejZuM1A3ZTFu?=
 =?utf-8?B?ekpuRFRkTHp1NUlBSHd2NUZPSlN6eGpBTG5leTdKeDhLckY5Vk54RmM1UDQ4?=
 =?utf-8?B?WmlKeTB5Yk5aTVJQQ0h6RysxYk1nd2srMGIvM0pTOC9NQUp3bEQwUjdlSFFN?=
 =?utf-8?B?ZkNrL3ZzTnlzRDZmb2RraDg5QXRycDd5c3F3Y05KRDYwU0ljZHlxaEFuNWV4?=
 =?utf-8?B?ZURWSW9XUG1MVVdhZEpWeXZ5ZHVud0cxTmhFQVk0alJ4dlRSdE9ncnFYTUV3?=
 =?utf-8?B?RGt6Rkp2Q2cxWkt1Tmx0L0VMMkJvNnlKQUNZemRmemQ3WjRuYURqVmEySXdJ?=
 =?utf-8?B?aXNmZGlPMERrT2ZuOHVDNDdoVlBWU0loOGE5YktkVUJJaDd5dStLc3dnZFZp?=
 =?utf-8?B?Z3k0ZGtUdHpzVGlHdFp2cXlYMHU5ZmNNMEMzUk1uTUttdnBncUFBcWZtcG9X?=
 =?utf-8?B?MnZ5NkdqaVFoaVRSV2lpc1B2MWFoOFpicFZqOEF2UWtBTit5d1crUWRQT0ZI?=
 =?utf-8?B?TzJ3bzBLSmdyL01lMlVxVlBjOEpZTVBqOHBBRDlTU282Y0lDLy9iU2ZRNmda?=
 =?utf-8?B?Q3hnV1ZYOFRiYVlsTkxVRVJJUVA3ME9mT3NpRWNiVjFMWkVLbEJTS1dvZ3NI?=
 =?utf-8?B?azgzNnlvVzU0RTU0UUI2ZTJRQVFWUjVKSWFyT1F6ZUZ2THhPWWdsck9tUHlq?=
 =?utf-8?B?L0MxMFRsRnc5WkFXNDdFR2xidTJ2eTBQN3orLzRzL3EzWkpyNXNEOHdiaWZw?=
 =?utf-8?B?ekRHS3BQQTZKOFhJbDhNMzZmTUc5dzJ2Y3NEbGFnaDFBdFBVRG1rTWhKZGRY?=
 =?utf-8?B?b3dVUUx3UGJzRHE4MWlvVkJSbUZMY0dINVY2WUtrK0FIQ1JoVGQzZHYwOXJ0?=
 =?utf-8?B?NjA4SElVT2laZWV2aFFaZEt6RmxvSytMZTlnM210OU5XdW5JcEZ5Z2l3aXRO?=
 =?utf-8?B?SFRuTEdCVTRKN0o2S2F0SWJhWnU5Y1dhZnYrUWQ3blVCbXNzN2F4WGNPMGVp?=
 =?utf-8?B?RjdDd3JvaTZ6RHJtUWZ5Sm9GVVk1T0NYaC96Q2RlbkEzcTAxNWE0bXp1Y0sz?=
 =?utf-8?B?bHNtTjZrNFZ3MkRmOVZJU1J0VWpubDVhYURkLzJyNWZlM1ZOWjRMbUZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RFBFRVc2OVpHbVJmajB5TzA0WHNBWEJ1YmVnRlFia0dxTmtVbU5GbWhHdHh3?=
 =?utf-8?B?VExZcFFNcVRid1M3bEZpM1RSdGJhQmMxUWp2ZnpOUmZWUXJUQUZ4RENYcHRB?=
 =?utf-8?B?UnRBMWJLemhKSEk4enUrKy9XMW95MlMzek5Ka2dPc3AvTU9TOWk1QnhRVEZy?=
 =?utf-8?B?M1M1VGE5Zzl1cTdEOVhhSGh6WUlRRjhmN3FHSEI1b0gyRDllVnA5Skx1S0Z4?=
 =?utf-8?B?aFcybzl2amdxTHFrYmxkUlNrcHN5YzZXYnhKekRyUjRoY1ZDZDJwMEZLT0Rr?=
 =?utf-8?B?bk8raDlDZjFUMU90S1BnY3o3SDU5dXRMTFZvRmcxdGpYMHZyaWUzSm9oN2d1?=
 =?utf-8?B?Y3Ara1RBeEhvZ0dPaERJdDhPeGgyd1JYQlAzdGFuK0hZVFZSaXJHS0EwNW1k?=
 =?utf-8?B?eitnNktjcmVpQWdkZ2twcDd1MDVWeDFVYVZldFVtN2hCYmVkTnVreXF6a1NO?=
 =?utf-8?B?VFJwNm9MQlBuSVRDamNxbEdxL2dmQ2I4NG9Qc2RDTlpZWWJ3aElHWkl5WFIx?=
 =?utf-8?B?SExYejkvaWFSd3NOWHo1dGNtcktLU1g0Vm5Tcm5iOSs3ekpZTGNNUUJuQm1P?=
 =?utf-8?B?ckQ0dWJVRitEaHlnR2p5ZXc3b3lXRFB4WFNYZTZBdDBxYUZCcVM2Z1pkMUJL?=
 =?utf-8?B?a0FrVExhMFRuSzBnWW5jQzdRK2RycGZDUFB1aVdGNzNkMm9aay9qZXdqN0lM?=
 =?utf-8?B?T0xBcE9kOWJtSjlmWEcvMTVzZXBsZWFrYVNPWVRPbG9iU2lXR1ZIQ3hIYWFY?=
 =?utf-8?B?U3RYSStlZUZVU2tXc0swYjhma1hvQ3FUZzFteXdBREFGMDlST3VuS2E5MzB5?=
 =?utf-8?B?cjBUdDFqbGo0THZsWVZNUy9XZnF0VWtJdzJlWFFCd21ubDl1Q1A4Wm9UOW51?=
 =?utf-8?B?QWszUW02T09SMmMwQXB0S3ZGY0ZlaG8wWGNROTk3SE9tMDRiUWM1RDBtbW9x?=
 =?utf-8?B?Ymp6RjJLLzB6cjZ5aDU3cUxwTEZTektscjNpcVNHV2lTMEtDOHNYUlZ1VXc5?=
 =?utf-8?B?WkZrUnowdlBhcnJlTzViOEc0QXplZW54MW1rRUFWUmpkM1pCbmZUUDVGKzZP?=
 =?utf-8?B?ZTJPcEM5Nk1MVTd0SCtyMXh0T3VXQTFmUlJrRXoxY3pveG1udHBrZXlzbktj?=
 =?utf-8?B?TUFEQWRBM0VzWGZCSTUvNHkwN09KcG1OUXorQ2VkaThWZFpLcHp2TFpKS3Nw?=
 =?utf-8?B?VXZxbk9FcnZsS1N0cEVPRVd6akpLUlYzb0NYZEYxeXNTWEg5TXZnbHN6L25I?=
 =?utf-8?B?ZWlpR29JNEVmTFFBcGh2cXFZRnJQZHYrZHJLUEg5ZkRobzUxUEJlMTBaSy9t?=
 =?utf-8?B?Qzc0WUVsa0ZCQjBjOHZsc2tsZnNoNHhwaFBzYUI3eEpUWjZLUC9FamJXMDg2?=
 =?utf-8?B?VkgzREdaUWI5VDVIclZaVUZ0Qis5clU1bXI4VmRLMXFBU0xpSnRaam1ZWWxQ?=
 =?utf-8?B?NFZXcWMvOUFEVXppWEhmMEVWMjlRV2tGMFRKZ1VVR0N5WGlVMEtFREw5OHBB?=
 =?utf-8?B?b0xtdzdFWGgxaWxIVlZuZkxIbjlWVC9JcCtxcXdHU051dWVkN3NsWW9pNDIr?=
 =?utf-8?B?Q0gvSzhxcUtycyt5ZTlvakprbWkxeGZKTHh1cml1R0Vjbm5taFcvUUVyWFpF?=
 =?utf-8?B?dUoyWTI2NWdKK2hHVkxQb3BJSzNHMGh6WlhIdkRQNXk5YUJQRUlRNTQzcnFr?=
 =?utf-8?B?djZOdnNGTDVib3NtTVhvdElpZkNwVXQ5R3AzQUxwVzdYMFFQQ0w1R3pxdDdO?=
 =?utf-8?B?czlFV0pMbHJvYVRXbmVnbmxaTjBCM05DOFYvSjdIVGF3OEk0S0xEWUtMMnVG?=
 =?utf-8?B?eVlYRmlhNVVGaFdsUUsyTThvaStRaDZsKzMzWFBObnNnb1ppWjBjYis5Y3N6?=
 =?utf-8?B?SWlGbzNUVGVJelMyRWZsMnBzUmVMT1JzNnNyWHlQV0J4dW5hbUwvUmR0cXhB?=
 =?utf-8?B?Sk14aGhzT2liSnNLSDZQVFl1dnlFYWhsbWcwdnlDSEhDTFBWYXhsalE1Qkt0?=
 =?utf-8?B?MVBrK2pUVXRBSkcxYitOK2x4U1BkcTFLV2szQU82a3p0dy93R3Y4c3J0UWgv?=
 =?utf-8?B?SHVLYzgwaE9uZjJHQVlyU0lKRXkrOFRsa2M1d214NUQ0MFRsZkVLNENnblpN?=
 =?utf-8?B?R3NHU3J3WVNvN2d6UmxFZU43elBkNmJ4aFpmVUNHTmk1STlPRXdyNi8rR1Z1?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2a3e28-5d83-42c8-1b52-08dce1fd48c6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 09:41:54.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivK4w+Xlfv5Cw+JozNSMDuT53ppL66rpHU+gBrmarPS0E/PoDGCR05J0FCdlgbZDUHFRBgP2upYmJjX9MrLqM7BTvGWK6cE5sdOnpe3lM54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 09:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5385

Hi Yoann,

On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This covers Poky's commits
> 47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
> a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v1->v2: Review from Quentin Schulz:
> * simpler to avoid confusion.
> ---
>   documentation/migration-guides/release-notes-5.1.rst | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index 75e57ea1f..9c375d7a8 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
>   
>   -  Miscellaneous changes:
>   
> +   -  Fix reproducibility for ``spriv-tools``
> +

typo: spriv->spirv

Otherwise much better wording, thanks!

Cheers,
Quentin

