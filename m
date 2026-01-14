Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B785D37E59
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:02:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13692.1768406551968827229
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 08:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ya19lSZt;
 spf=pass (domain: cherry.de, ip: 52.101.83.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0JNoaaaw9x8vvU9JBeldfQpT+NNMX7N/fiQIPAlcGy3MEBioHEqec21jKLUk9rDEXi6y+FHTlueAYLwNr6fH2Gy2bbzydaculOMuKJyG7J3154WhdkOyMoq6v8YXc938vEKCaZHrzs6Aenaf7RNPaZhpxnT5Oau+F+A32F9uF/1Dl1ySYxLLVWnu6qR58prycFgaL+t/49UPVigKIM5BjOcRLgMpj/P5jVJtx56cchKBp0l+A/LtCPOOArRTWwOGgHFWhk1etjRDBtNtnCmrMKbJfty/qJNZw5leqGXunVLUXS7CGvZ93J8orRpcctA3qnGyPWXx/fI3TWFG1IqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1KE6riRX5EkmdrDYCFknf53usNfCZt7mwPaII59Irs=;
 b=VTnYH0JgYzsFOTsBICq/zOLr214oTzDhUv6miz5WrsTsuvzbfL7oZ8u6aUCz3+7F1jccQXQw7+cE9mhF+Hwb8kZcGBGXmH01nZxzEAxkO30XKwtB2QQ58RweP27H5A6v4U9020Yth0NhuAKfDWqojf1ZBZLp2AhzL1p0d1ecNQvLc5XLHGBkwyK8vZep4vGlJbIekzU0bmEmJX3nzcdxUPTVjiVn9k72xV8iC5MBbdDMGsK7jnM/6v/Bl5B/Ageagb6s5wWHVsQWRSV/x0GLbPZ07y79ppf4GcWe3YqCsucN5hq2QQC7toeQDwG7ChGOp83m5R96Z9tgPfdEREHu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1KE6riRX5EkmdrDYCFknf53usNfCZt7mwPaII59Irs=;
 b=Ya19lSZtnDeU0XoljVarVbYKZ82v+DaYHEcTaz2u9D0hAQGY7+29B3IB/zUP7vxHO99CQmECM0h5pKx5nmy2NEXsvCVfZqIyo5Q49kgmzaoYT7O+XYhorBtA8G/cYvk3eE/0cEdTdmO+Q+VmTkP0C9rQE3uKJ/u4VBzKcH6QLgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 16:02:27 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 16:02:27 +0000
Message-ID: <c4f18097-1903-45c1-ac66-e45227775a50@cherry.de>
Date: Wed, 14 Jan 2026 17:01:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] my opinion on why i think the docs need refactoring, with
 an example
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <a7e2a0dc-1509-aeb7-cab6-ee9f3f1f0a22@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <a7e2a0dc-1509-aeb7-cab6-ee9f3f1f0a22@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 20472a59-5610-4a10-f463-08de538650aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eG95SDFLQXFrQklBVWRWZlA5cmhhaHc1SzJ1bmxuby9vQlNhNlhSOGM1cWVI?=
 =?utf-8?B?UTB6eUxXS0labjcrWkNyNys2emRlc1dqbCsrSUgzeUU3ZnpaZGpOTElPRWhk?=
 =?utf-8?B?R29BQktBRTc2NGdMUHo5WW84YkV1SWIrL1pwTGNYS1ZCcklSL09yZGtyR1I4?=
 =?utf-8?B?Rjh1OGcydlBjN0hrMjY0STFKUUtBb0FGamVkOUJhWXU5aE9ob2xYNFFQeUor?=
 =?utf-8?B?OU5nY2R2WnBxamEwOU1LbjRlNFJzU2tHa0dNR0RmNSt4OTh3WGY2Ni9kVTQ3?=
 =?utf-8?B?Uk4ySDRjeFNFSnU1VE00NDJaWklicVVnRzRGRTVTTHg1SktjWDVYdHB0UEhi?=
 =?utf-8?B?QXlacVJBK1BqZSt0QldNZExVNXFFalhLOWtyMzc4VWloV1lJTXVGVm1yM0Vn?=
 =?utf-8?B?VEdGM0JQUlcxODhHaGFlVm5Ld2crU0dtU1Z6bEUvOEFvejExaFlQNVc1L0xQ?=
 =?utf-8?B?WlJxNllrV3ppR3NBWXJEWDI0L1ZFMkVtamU5bTNieUpiRW0veDF4Z1FhY2JI?=
 =?utf-8?B?OGhvSmhrUEZId0JaNUJHS1cxaUJzNzJUL3JTOW8rWHhmRDRQVklldlZFc25B?=
 =?utf-8?B?emVNMHJoaUdMRDA2OE1DWkpOa0NhbDNiMkFTQUJDK2lCdEkwV3ludWJaUTBt?=
 =?utf-8?B?RXc3aVFhU29ZNi8vVlVGRk5PT2lId3ROeEppUDJqRVlGS2lmS3d4SlVrdFpW?=
 =?utf-8?B?Wm16bGNZT1JFdHdTQ29rSlV4d1RMeC9YSGp4TDlNNXBHL0RZMWttQ3g5ekto?=
 =?utf-8?B?TFY3SWZ0b2NNeEg2ZFNlWUw0TXQ2TW9qT2Z1VW1WTTQvcmJWUVA5WGtWZUdT?=
 =?utf-8?B?NVBnMHBwa0JnamJEdEtqRXNKMko0MGtkZE5DK0IwZDZFcUh0UWJSVUZZaHI4?=
 =?utf-8?B?ZzNEalpBZDBZbDc0UU8vUVg1dndSYXJtU1ZabU9TWUc3WWNMdDBuTnJXWUtG?=
 =?utf-8?B?b2tkM2NhQW5wYzlSQTY3bkJya1M0NGJtYUt2M2NqaUNJYVh4TzlCMTlTcStE?=
 =?utf-8?B?aGZOdTg2VWkvbE93UmVvcjNvekM5VzYxSk95MHI5anJ0Mnc2eTdIaUJtemdJ?=
 =?utf-8?B?SlhyY1VRS29pRXNwV1JOUlFsRnJGekZ0cXpGc2VoUDAxY2R1b0hSeXZLSWNE?=
 =?utf-8?B?K29UTFphZHNTME9QSEpqL3JDUFlXYXRjbUlEeXFiV1NaWU5yUWY2Tk1uU0Fm?=
 =?utf-8?B?aFBJd29yZ3JWVlV1d095S2p2a0FnZXBFdkRjdGtyL1Q5RmF4Y0ZtUnp5MnBN?=
 =?utf-8?B?eHhDMW9pU1h2ZkdLckRUdlFDVDg5MlJUQXAyWHVTMGxBMWZ3YXZnQkY2djIy?=
 =?utf-8?B?VHpJOWtjQ1ovYXlOTkZtcURJd2NyaGhpTTJ0TDJET3ZCTFZtaEJXbld4UzUr?=
 =?utf-8?B?eHQ4YTR3d0RSM0QzRkY4K2M3eHZKWGkvN0lKcUNoRGN5TnIyM3ZRQTkySk5p?=
 =?utf-8?B?elhpcUttZzA0UjVTeUttSWg5UnpQeGRJUHFQKzM2VEFCUDlTS3pVNFJ6czkr?=
 =?utf-8?B?UXBDRHNUWkhwSXdBR05VelE2NGlFd2hLVnBQa01zeFJYMkpDdkNmbUQ1Tmto?=
 =?utf-8?B?QUhJWlhZdy9TdGpSR1JHOTJJT2VJTkNleC9YUkR0YVZUNElKZTZMTnF4M0xL?=
 =?utf-8?B?MTBtZXdudEl3YWkxMWN0RkV0UHIra2EycW1LVHIrWU93TzllWEFhZjVHbEds?=
 =?utf-8?B?dWlsbEhmaWJydTZaa3JZTG9DckRSVDhFZkRGSTQya0M5R1FlYVZjRWdWK0xt?=
 =?utf-8?B?L2w3WkVENlYwUHEyT2FmNkQ5Tjh1dGEvUk5XUXNQV3BsVlQwZXlReXkwSjVK?=
 =?utf-8?B?Vm9JNldSNWp1MXpNY2UvS3R6TmthZnhpajAvWmVmT3ZCcnFacTVLZTQ3M1pk?=
 =?utf-8?B?OVB5RSt1TzNpU09qOWQ0MVRTQXVVUHNheS9uR3UrdTNwVzhhYXJ5MmpaR0xE?=
 =?utf-8?B?SldWc0lFUDAwRW9CL1R4STlQQ0h4TTZ1K01oVmtlc3VhQ1JYTVFmT2hIb0Vj?=
 =?utf-8?B?MmpCeEhlOFJOcGxOSFFZNnBNNkZrZDJTa2NIazZ4ZTZMSmp3enMyNlBESkdi?=
 =?utf-8?Q?/zhFUT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWtvUW5lWFFMZVR3dlczUTVqUDU3dU5GcVE1T0sva2lPSjgwS3BiTExFOSt5?=
 =?utf-8?B?aDBqaDFva3Uydmljelo1ZmFxbEQvRHFLODduWGNYYzlYc1l5NFNib3N5bUlP?=
 =?utf-8?B?NXA1MnovVWhJR08rWGhRUjV3ZkU4R2tEZFJlUTFIUGRJK3g1alBGRzhSSGhX?=
 =?utf-8?B?R0xOOUU2aEdLZyt0a2NmSDRTSVNud0lYVWtJYlVweVM1QUl4QnY1VnZkOHpo?=
 =?utf-8?B?RnBXZ0hBbVN4bGlSYmxweWs5TDBGcmZxa09qVHRNK29aL1IySzhndXpvQjds?=
 =?utf-8?B?cG5lbVdTVDlWWk5lOCtoeGlFT2huWFlKdUZqMS93RHVGaFFkZFN3b0Qxc2ds?=
 =?utf-8?B?Ym5NVHJIbElsYVRENjExdE92Nmw4QjM3T1BYNVplVTBmM3NLUTU0RzgvSkZp?=
 =?utf-8?B?dzY4bldvYU92Z3RkdWgvaklmNjY3RnVtMjdPdFJYZE9iSHpoZllTcWorZG1V?=
 =?utf-8?B?LyttUEtxSXdkeEFNSGh3VG9sbTgzVTRDcVhXak5adnRBbnFuWFJBbTNqY1FY?=
 =?utf-8?B?QWRBbThkTTVuWTFkaWUzWTB6QWx5eTRnU2hNSUpzRDZnTmVjdk9lbTVaT2x3?=
 =?utf-8?B?LzNldjJQc3VtWnA1a2ZJK29IZ0xxZFRWbXF5RjFXZEZub1pUVnhHWEx6SXNC?=
 =?utf-8?B?czNMWlB2UkJhTkVVelI3ck5maGtUQ3hjN0Y4TE5LejhmZThjblV5b24xalA3?=
 =?utf-8?B?d0tMR1ZGb3Rpc1h5cXE4Yk93LzdKaUNMeWlHTjdKcFdSY2x0YXZiUmhPblFj?=
 =?utf-8?B?a3l1V1RwemhXcnVHajREbERBSWFvcTEzYUJ2Vy8rRkd1OGV6R3E0OHhHOFZv?=
 =?utf-8?B?NnQ2SnVMaUowYTI5cmFUQkdmL1JuVzI1cjlLR0hJLytvUENxOEdHR0c5ZGNL?=
 =?utf-8?B?SnQ5azBWcEVZNm1IS1VIcGxNamV4MDl3bHU3ZWgySFhCL3paV3pHQ3RqV1V4?=
 =?utf-8?B?azA3cG5TWmQ5Mlc2NHU5ZjRocnRsVWRIYmNTdUFFeW53alNlTDlEM0RmUjJl?=
 =?utf-8?B?V0V4ODIxZFBWaC9LUTJHREEwN3VFQ1VDaFBtRGRrNXova2M3VGRsU1VqREdD?=
 =?utf-8?B?VUN5WnpwSXBvSFYzR2V0K0lrSDdueE9HU01BZWUvWWZZa2V6bEl6c29hOUlv?=
 =?utf-8?B?Yk9wVTlWalNPZVY2TXpMUzNKS2RpOHFBdVMwT0Y4U2NsWWo5bC9PVytHdE56?=
 =?utf-8?B?ZHljK1lYZXVHVktETkN4bHFGZEpZeUZLaVVVcVJxQ1o0Y3BnZk83bzVBR2ZT?=
 =?utf-8?B?N0t0U1ppb0drVVl0azIyak84czFZaDRJYXF6RVdXOEpia0VrcXpacks1cUFo?=
 =?utf-8?B?cHp0TEdNY2tEMmt3ejlqRDh2ZzhZcVYvVU9hK2VOT051WDhEUWg3djE5TmJr?=
 =?utf-8?B?S0QralUrWlZtbUJxOGVLcjIrUHNRSFNsOFp2bkRlejZyWTF3ZmZidW05eXUw?=
 =?utf-8?B?dUNucFVZVUdlbWVsait2ZEpndWJLbk12dXFHZmRiNGZlS3BmS2dqZ2dPbXFp?=
 =?utf-8?B?c21uMWVNY29DaDRQZWpIR2gyREhtUHNOdGNhMzQxRk90dHNsTmVHcXY0UXBp?=
 =?utf-8?B?V3BTZ3NhcG9ERFdUWmRRbWpnUWdVT3VVRnNmeCtuME0zTTd0MndMZG0yMDIy?=
 =?utf-8?B?Z28rT2JNQ0x4SUNyVW1aajdjVHJEbXA1UXIxVHNjYTE1bVFPalFQbHN5MERX?=
 =?utf-8?B?TUlhWmpIZEUwRGRIZCt6aWc3a2pOeUFpd3FyRytIeXUwcEVHUkZMdldTeGdl?=
 =?utf-8?B?ZjNBZlkwWXFsRDYwUDl6bVR3cnJxNTkyY0ZEbzF1b043YTFFLzJ1djhhbjd5?=
 =?utf-8?B?M29NZlNwTlRualVybkpXYzlxYmg4VEErQ2oyMXIvV2tMU0JXUFZBck1jOW1Q?=
 =?utf-8?B?STdNZnVtZzVzaWFBc2VUYUZBc0JTc1lwTUtYQlp1YXBrN2NBVGtVRnU1R2dT?=
 =?utf-8?B?aXBKNTRBVmpXNUtSUFFrSnlkeGk5d25DY2dSbHdwck1kYzJIL2RyMGtEaTVK?=
 =?utf-8?B?YXc3aGoxSEd0U0RJZm5vN2pzaXkrdmU2V1RyakwzeDdabXlGY3B1S2JNTmVD?=
 =?utf-8?B?aWFIcUJ1Si94V0htQmEycjBlSW5QUXdIZFpLV2dDc2Nya3dWeUtMQWJrVzJx?=
 =?utf-8?B?SUI5MFVOcnRFTXZvMHFMc0dRdzY0UWtYOHBQbGVpN09GQWt1MDFhM2syNWRC?=
 =?utf-8?B?dGorOTFtU0pyOVpzSDhRanc3ZkR6alRJNkhOUFFaNWR1ZHUwaEVzeEtLTnRB?=
 =?utf-8?B?NVM3TW5kdmphQVBwWmx0UzNjcTY5WmZRNGJmVHIwelA1ZFYzN3pBK2JtY3Zz?=
 =?utf-8?B?ci9GbVFpL3MvbEx4c2llTnJlNXF1VDU0VVczNEJrZHF5SjczQmNpUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20472a59-5610-4a10-f463-08de538650aa
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:02:27.8533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vD9aB62zPqMxlDwOYikvJJBFQi0X+6yl/91E+czf1uTJugHzJzxQG6eYn3DeVZHVS5s+FP8EDQRr+F3EaxnQC/k97x6ISm3yli7WxeI2BHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 16:02:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8559

Hi Robert,

On 1/7/26 5:04 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    One of the things that has bothered me about the general OE/YP docs
> for a while is that, in things like glossaries and reference manuals,
> there's too much explanatory content being stuffed into those
> sections, rather than being fully explained in a single place in a
> single manual somewhere.
> 
>    IMHO, any topic or feature should have an adequately complete
> explanation in one manual somewhere, and references or glossaries
> should have little more than a one- or two-sentence summary of any
> concept, then should redirect the reader to the full explanation.
> 
>    Here's an example related to PROVIDES, where much of the same
> content is duplicated in both the body of the BB manual, and in the BB
> variables glossary:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#providers
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES
> 
>    This seems inefficient and somewhat disorganized, since the poor
> reader becomes unsure where to find the definitive explanation. There

Must there be a definitive explanation in only one place? Won't that 
make the explanation hard to digest and overload the reader from 
information they may not be interested in? (I understand this is mostly 
what you're complaining about wrt documenting in the glossary, but 
moving this text verbatim to another place isn't going to change that).

> should be a single location that fully and completely explains any
> concept, and all else should do little more than link to that
> explanation.
> 
>    This would make it easier for volunteers to offer to write
> documentation, since the rule would be that they're expected to
> explain some concept in sufficient detail, that would be added to the
> appropriate manual or user guide, and everyone else would simply point
> at it. As it is, I think far too much explanatory content is being
> placed in reference sections or glossaries.
> 

I believe the status quo makes it easy for people to write 
documentation. New variable? Add it to the glossary and define it well 
there. New class? Explain it in the class section. Ideally, mention it 
in the migration manual if something needs to be done about it.

Also, there's a fine balance to find between duplicating explanations 
where it makes sense (easier to read and comprehend, harder to maintain) 
and having only one place to explain everything (probably overly verbose).

I can't remember where I read this, but it's been said that good docs to 
foster a good dev community is built in 4 different ways. Tutorials, 
how-to, explanation (of concepts, workflows, ... I guess?) and 
reference. See 
https://github.blog/developer-skills/documentation-done-right-a-developers-guide/. 
That's for sure not where I read this from but I'm relatively certain 
those were the 4 pillars for documentation.

It'd help if you could provide some example on what it could look like. 
 From experience (I joined at the end of the sphinx migration), big 
refactorings are notoriously long, tiresome and difficult to finish 
because people lose motivation (or time; or focus; or life happens) in 
view of how much there's still left to do. So we must have some kind of 
plan and a way to split the work into manageable pieces both because 
nobody will want to send one patch fixing everything at once (while the 
docs are still evolving, thus conflicting every time you rebase) and 
because nobody will want to review this multi-thousands of lines diff.

Cheers,
Quentin

