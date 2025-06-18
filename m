Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA995C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:27:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.3])
 by mx.groups.io with SMTP id smtpd.web11.129.1750256827468670158
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 07:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iKqR6qOD;
 spf=pass (domain: cherry.de, ip: 52.101.84.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLxUl7gYeNArJO9lZR4gG8xpcQZpaO1ROzTzYh9ceYmUDDP8F9FtP7l+Wubsno0lHBoXE6YjefDK+qElDEUHa7v0n7EBMFjk141qpgxoGb+WXcEtMrUm57Y322NhL/WPFeE/FR9DSAsGZ5cbFrYwLVtIN/Xa+MtCeGwZ7+JxEfPYV6pVqza4lmu8M7tqcsQ5rj8l6XViMKG0zTN6IMJWHhy/GLkaeOfLf6IpPFBawToBWROhaldzrrttHXMLMtjGpYjx2HLSRKk2oOZr6ZN17KpFsxqPJIywRKpMzerbDUhrxD7gUEHA4nEuJX0K9rparCU9NfTUEaqaRLi98t1LQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zA44nWWEf9mxtFVC6QtAn/7DrTMtRrL+iwk2XFgew0=;
 b=dVZmPTEHpwKHNwhT8c8XKno9/sCI9geAz5AikAHM5jTlFHSJ35wxzfzUi5UXgcB7hsCzf9fXOl9P5AzTkHZ3tqFF+zp0D31CnslVyzPFdgpdbdbtRuhx8kwVE1yGdJbGoNnXb4ue4rHLSXJLsbUXL7FWxUTqS5KPdJzzhUPYBGLRZyGiOn1wJAbfmo/tOtzgFjDfQjwMAzUDqVvoBRW1SGoosiYXHUO0uuhn83I1lJNsHaLoeZeP6mreU06Se36PHAK2LGmt+fmXTabPbQY6fiqS8Ikhp4fAOuAywhJYsoNW1AkweQKbbII5f334NBzbtnlStOesprJSZPUJ0gN8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zA44nWWEf9mxtFVC6QtAn/7DrTMtRrL+iwk2XFgew0=;
 b=iKqR6qODf2oQBhb/RxpB2XTpMkuqbR3BbcmYzvvA4jLk8kwTB1ah/OAn1sm6ziJwMKiIDLy0VnsKWcI5wrwv0NMro0Rf/fu8Bj49odilLF+bopNKCjyTLNUkZSE0NsEBiSBKKddIfXsRwCnmrBGIe9IbEp1ZtN61s/v87n8JEJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB9825.eurprd04.prod.outlook.com (2603:10a6:20b:672::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 18 Jun
 2025 14:27:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 14:27:04 +0000
Message-ID: <c5f44603-e1db-477d-93af-2161785811e2@cherry.de>
Date: Wed, 18 Jun 2025 16:27:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] bsp guide: update kernel version example to 6.12
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <dc8e4016-70d0-d090-6d8f-3996212563fc@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <dc8e4016-70d0-d090-6d8f-3996212563fc@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::40) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c368f3c-8c71-48ee-3d56-08ddae743237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NC90OUdVM3B1UmlUVkZSaXF0c1MrbDhlSGZMSGxZRlEzVHZ5aVVWNnpyMmhs?=
 =?utf-8?B?V1FxRXFOODNmTEtSUUhRZytaMjQ4TnFOME1KUmlTdGwvcjZhVzlxemxIVGk4?=
 =?utf-8?B?a0hSWnFZNE0xTCtJdzQ3L3ZsYTFML09Ed282aDUxSVVmcDZGbFhRVGtqa2ZT?=
 =?utf-8?B?ZXM5UUdhYXhHTTRZTDNTdXFFb1lsRFd4QUtUS0k4TkpvOVZhSW95TnFoSE5y?=
 =?utf-8?B?eW51NWM5bEpWVDFRdStRWGRYRFJKOUhxSHdpdTdVVnkrV2VFWC9UVTR5dVNL?=
 =?utf-8?B?SHdjN1RwUC82ZGNacXlSK29yQ2N1RHdtWWJnaDA1azlCM3JLNU5zWDFJL3Rl?=
 =?utf-8?B?NGs0L21US01nTnA5VFlDTVdrWnZIQTdydWhaUFg0Q3hYUnNvTHkyUk8yVHFO?=
 =?utf-8?B?cDBGVCtSRWZZWmFnNEZuQWlqQmhSN3J2VUNiTVFiN0RnbWlrcWFNdXMzUlFs?=
 =?utf-8?B?eUlhZlIxV1VPMmNUeitRbElHaDl6UXdOV0xLcjZIL1Y0c3FiRHBvejhzVk8v?=
 =?utf-8?B?YTAwK29MOHRMV2phTU43eFlsTGxBdDFFMEJ4MXNtUGh6eklBMFZFZmpGeEpw?=
 =?utf-8?B?aW9kQ1A3TmQ0WUpyVForWUttVUpjNXNmYitLUm5aUmJTcnNMSkkxSFNOOWVs?=
 =?utf-8?B?TlBVaWh6cHhzQXZpTTJzUDRxWWR0S2VlQlVsTGhhNUJlRWhTcXR1Uk40L29J?=
 =?utf-8?B?M0daanVlUkRXWkducGV3c0NoNnAzQ0MrbHpOcjVBaTN2dmN5dVAzMi8ra2c1?=
 =?utf-8?B?TU5sbHpuS2ZMTnAzRW1Vc0p3SEQ5VVFpa3dqRzZwSEFiay95TTdvZ2dMWGY0?=
 =?utf-8?B?QVErckZBRWZoZ2VDY1dNZFBQK1Q4ODZjRTF2N21VOTdVWlNOSG81Zzd5NFda?=
 =?utf-8?B?eFFRa2hFVThBcHNIYjRzTU9ndkNmaEo2aDBnbHhvVzMxM2VrUTZWcGZjL1oz?=
 =?utf-8?B?aTRBOGJiNTNkMm1Kbm93R21zaEllT0NUSy9TaTEzZVF5V2daQ0lwNWRqR3VE?=
 =?utf-8?B?RXJVeDhRa2txU2VJYmFpUmtCWStGMWEvQnJJMVNRRStudjFMM29TNzZqNEV2?=
 =?utf-8?B?ZE9qeHNXSVo2SGVXMGFVL1dsTHVaSElSQmtYVmtxSTRZVnB4bm1SYkpPbitD?=
 =?utf-8?B?RlZZeXA4U2thUFdlT0pEbW1BbktVVkZ0Z0kzc09zbTc4UzdPb2NZT0hnaTJF?=
 =?utf-8?B?amEvS0VpeVVITFpwL2NQcVNmanlMN1dISGhZRENzREVCK3M5Ujl4RjczTWZR?=
 =?utf-8?B?RXNUaS9RbWZDTzk1V0E0bUVxWWxuWTBRMzhzamMzbWtlSzR3WHg4eEpubm5O?=
 =?utf-8?B?SVVkL1ltc3hacEgvSUV5dDJva2dGQkovMUg5YTdhU3p5aXhhbEJnNWF6WFJC?=
 =?utf-8?B?T1pjZnVGblRBY1VRMG44cjdMV3JtOUtKWFdVUHZTUkU5Y1p4dUNHekhJa1hU?=
 =?utf-8?B?Q1NZS3BZOWJVTnBML3ViclN3MzZoemswR1hnbGV3TkdTblBEUEJjZm9jb0xn?=
 =?utf-8?B?R2oxZTF5ZC85aUZBWGI3WlI0cXc2OTFhelozN1h0Ym4xZUhIb0wxWmF3Zklw?=
 =?utf-8?B?ZUhKRzJJR2hScjNmN1pCR2RMRHE5bnRRSUU1aDYzSmFBWHRiQmxOQ1VpSlA2?=
 =?utf-8?B?RjlVUmhTQW4xVXVadU5QMlo1Um9nZjgxMTJPVnJtaFFQL2hVSXIzUVhyOXlX?=
 =?utf-8?B?Q2pBdW52VDZ5THliV3dUTVc3Qy9URUo0SXNaUnJyTldqamxySTIxTU1TZlVy?=
 =?utf-8?B?Q2VPQ0ZGZ0Zrb3RNNU1DeVJEeUVuelRPTENOdFhnaHBFcmtqaWoxRCs3ZnpX?=
 =?utf-8?B?aHdHOWhsZDRNcFp6OTdWWTZodk9GdkE4djFtSmltK21NaGRnYkMwM0Z2OUYz?=
 =?utf-8?B?T0tCUW1JQ21sSXdkSTVBT2k0Nzg1MThjU2Y5L0FoRCtoaWtsQmZJYmJGVXJq?=
 =?utf-8?Q?Lpfyx3yC8Gw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjFqZDJBUW1VT2pqbDJ1akgwRDFRQjRBUERXcCtCaCtBMTBHbk1ETlhWck1m?=
 =?utf-8?B?T25DeTkzY0FXKzN3RGNCT2xibFJzQnQ4Z3QxVG9NdDBhVWsxOG96cGczN2xo?=
 =?utf-8?B?T2VjcDRjQWZnU2o4QkY4dDFqWVNDaWtiMWpaTHJoNHNiTEl6UXdJNFh5WDhu?=
 =?utf-8?B?U1ptUmpZTThUUkQzWUlvaXU0R1FFOUtGc0pzUmxielJkYm9xZU1VMS9DM21Z?=
 =?utf-8?B?Q3BYajFRYlBZazl0RzRDTVpTZjc4clFKZDFtVFpKL3JISis3bDV1S2VWeFFC?=
 =?utf-8?B?MUZQS0xobG9oYU5jV0FncDV6YTB2Y2FlZEVldW44bzZIU0g4NmduV2U2WG8r?=
 =?utf-8?B?bkxmNnB2d3JrUkFKUFJ1SGN2OW1pTnAyT3ZROXowQlFuYW9ncVdVaFBKei9k?=
 =?utf-8?B?R1dXZFp5Qk12amVkKzdLelk1Yy9yT3VHa3JmRW9oNTYzNEtrdk9SM3VKOEVN?=
 =?utf-8?B?c3NmemJhYXRBOVFKT1pQbmdrYkRjMlR0SkhZSEllb0ROaGZ3Mkh0dThIUG04?=
 =?utf-8?B?eGJuc2tQem5qWEhjcXV1RVZmNHFTdVY1RS9UY0gxbjlmcEszL3dpUkp3TGdS?=
 =?utf-8?B?cGdrZXpSa25QSTBLdHoyMzlmTHBlbHUzdDFwazlIaHIrVEhWdkthdXBZUnVL?=
 =?utf-8?B?QUFWaTdIZ21PdnduaDg1Rmo1S0lBSG5iU0cySm4vOVMyV2kwVllaVlVZUHdB?=
 =?utf-8?B?TUZtbHprWmFrc3pBYzVtcDNXaVF5TktFcUZWN29ablkyek41aUFzNXpPdVd1?=
 =?utf-8?B?Z3JseHNKQWxSOWFZa3F2SWIyMjZGSmNjY25uRnVKSmpnVmhNQytUYnMwUXBF?=
 =?utf-8?B?Y2EweWVRL1dzTzNmQ0RxSkF3QjdIWktHcmx6N2wrdzBvbys4TDJna3N4bEhx?=
 =?utf-8?B?a2lIZGxJaTNyaUkvSkVQK2FYVURIallFZm16QUJ0TVlPMmc1ZXNaMDJwVmYr?=
 =?utf-8?B?SERZcGp4TzZrejJoUndNcXFoRDRucVJMdHJsOXpWS2IzVlVHc1RVWENybVd1?=
 =?utf-8?B?RmdFQ09HUVBuNDE3dWRnY09MOWx5Y2w1M3krL1locGFaQ01hR1FEaDI1YVY3?=
 =?utf-8?B?Z2dyZlZsdUtnZlVjZ2xLdVhnVlQ5ZWN4T3RhUGhrOFk4UHJFOEdOcVljL28v?=
 =?utf-8?B?SU44cjh2YWJhMjRYKzFuNmpEV2JpTEhVWjRUSEFaS25zWFBudllVRk4rUE85?=
 =?utf-8?B?bmFSNmF4azA2MFFGMER6dzJwTlJNM2lvak1jVkhBQTFDTlM2RnZyN2pwNzFN?=
 =?utf-8?B?Ym5JNzhxRHI0M0x0NlhSMlErNXhLakJoOStlaG1CczlrVjdYWEtaa1UxOTdm?=
 =?utf-8?B?dG1BWW5GMFQ0RG5Sb2pIOVE0NkVyeVhuM3NWNWRPazVXZFVSRTBnb3o0L3BO?=
 =?utf-8?B?c2dTVno4NkdLa2p3S01heXJ5TWNRcVRWVTdFVmVQK0VTcjMycjF4a1Nhd3Rl?=
 =?utf-8?B?b05HYnVUdUZEK3RiazBrWFBVcEV3c09YSTdpK3pabmNzR2RQNms5RkUzOTd0?=
 =?utf-8?B?ZDNEcW5hVFhyUTN2VmhNcVdpUDM1U1pkdnUzSWhZcHZieXFlNnNyRXhuNTh6?=
 =?utf-8?B?NkROQ1NTWWVkYUR3U01vTGlLNFFOa0t2a0FXT1hWT1huMExTN2NjUDhZL1Yw?=
 =?utf-8?B?MHFiNFY0eFNoYnJYUVhYaXRDd1EzV29RNnFzVW00UGdvVjVsZEF2bzluQUxq?=
 =?utf-8?B?VGRqTDJhSHZYd2hxNGtQdVZaY1RwbDN5dEUrTXhINUE5RVNmcWMzcUlpSENO?=
 =?utf-8?B?dUVNaTZOSE4zbE51Q04vWEoxNm95VW5QSVZsa2dwajNZOTgzQ2VFQmVkbkk4?=
 =?utf-8?B?ejRtOWp0SHQ3UU9jSit6djN5WXpKTFR1dkF3d2p6Q0dxcjVGMlJQYmE2bHR0?=
 =?utf-8?B?c2xvTHFLSm9heEdLdWlJZDczRTVGRXY0cjZ3YVBuVmF0UWdBMGxnaE8vT1do?=
 =?utf-8?B?cXhIUTBLbHp3M3BrMzNPSG9iUFBIN09GTTAwM1hPLzIzc2drOWNlNlhkODVn?=
 =?utf-8?B?eklJK1MrWFFvZG5HODZaTEM3Z2NzL0hodHY4MHNvTXpmVHRDMGY5SVUvczhR?=
 =?utf-8?B?eWlZdEJ5K3ZWY3NwTUpTRlM1ekdXaFc0clU1KzQ3ck1tYTg5YlZxa25ab1Y5?=
 =?utf-8?B?QkRVcTNmaFYvZit0RmlFYXJ1L0w2RDBnbjAyWXpIYW12OUlDSVNXRklURHo3?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c368f3c-8c71-48ee-3d56-08ddae743237
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:27:04.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RokrebrxzNco3BRHfUxPxzw/YXiHpUh57omAbX4hPZ5shmZTCUMiA9ZS/2/He5KS5+hLVAQHxAWGq6s0Y22ylY7PwXRD2cx/vMnPFnsowP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9825
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 14:27:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7101

Hi Robert,

On 6/18/25 12:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Change the sample kernel version being used from 4.4 to a more modern
> 6.12.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

