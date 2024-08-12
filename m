Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5795AC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:47:53 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.11])
 by mx.groups.io with SMTP id smtpd.web10.42684.1723456067210093569
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 02:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UdR8iRjH;
 spf=pass (domain: cherry.de, ip: 52.101.67.11, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbhhnTu18BVUd3YcEUTI52hEhf0NDAxo2WDYhTVXGPIcAx7yMBZ8cisiDIbU1GSQ7FuMr6sr1PUEmUjjtOtAkRG3PCHvPY+Jd+K224dJlYAWlS+hWHYdL1KSh1sLsWn84kwgxAyLbQCZYadUQsMcuv1nC7osylMk7GVbJvCWIf5HB/r2KzfFTDK4rGTf5QJ1b+bOr3GMsY1/DpKTXdHLzTyP2WouXPcgWKdURlWBCdFnd0Vh39wDkXldzHlvJ+/h795KaIm9z4XknQXNq7REwSDD596W1IW7i+q7JVNNcCnucMq4OuGskM1+m/T5BjKjlwOuLXpTko6N3y0T4M7gVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8daDqZFaqO77zjXVVpgcjOuWEBnPm4p7kK6I398foYU=;
 b=esaLH+9Y7WyxJ0S25L7RmZJlT3Bz8EzOmtvFJhDiJKDX9hOBOpPdcT7537ANZDwW3Cl2pCwOag7Vg28Hy07okzjnrjVosg9AZq3uEARwW9NPBfTB/92LjxwSTXo78WxLwfVQQvrXBLmk40RAc3kxa77khEgSTwpeQJGUPNE3+H0awYv1Cmpe7C3r55wUMdFmuYH9mzZ8KQtcCrSNw1zu9pbVw7N16wAbRHr0GVkdojL/NfxC78fDyLXKGMUxtlaGSZtrPAJt0z9clDw0bE4hhwjsovNgyHocXVmcVfBZW5jxI+EstRZJgueJlw7IFwXZvoFLqb3Dq/pUfTZe7II50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8daDqZFaqO77zjXVVpgcjOuWEBnPm4p7kK6I398foYU=;
 b=UdR8iRjHQg98Zu6fGaOgDvk0O/G6g3lCqCv00XSH94TloHYzXAkmTLRAq03oW1W3LEps21pDxFr4SMecbAXqhbFcu907rQTuM4mNvPPMVvzBfVy7EGt+ZzoezRwIRsI2sfJ6KgbpVLhylOcnXL8/gmVxWjxL2TARycoEXBiN3oU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AS8PR04MB8086.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 09:47:44 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 09:47:44 +0000
Message-ID: <72a83633-1744-4eb0-a947-3709705dfdd4@cherry.de>
Date: Mon, 12 Aug 2024 11:47:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: added wic.zst to the IMAGE_TYPES
To: jan.vermaete@gmail.com, docs@lists.yoctoproject.org
References: <20240812090306.9098-1-jan.vermaete@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240812090306.9098-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AS8PR04MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 422f97c1-7401-475b-5452-08dcbab3cee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGZWYWpUL0JiZ3hRSS8rN0tnQXIwR0FPcmhNWS9mNzBnZXl6dW51WFd5STAv?=
 =?utf-8?B?ZEhKMVJEdnVud3ZlaWJnenFzWXNZaVV6Sy91RWdxOU5qN0hZQkFodlpsVXVO?=
 =?utf-8?B?WHZHSVhvRWZpZW5MTzNoYTg2YUdHQ3dPUEdOTGpFdGt6ajE0QXRhRDFWN0s1?=
 =?utf-8?B?Yko0dzhOYk5sU2t5OElqWXVJaXVOeUc0cVFOVU5GM3piQjdJbmM1T3FGUk1K?=
 =?utf-8?B?NVFWVklIWjhNNVIxUHdnT2FXdVBnMEt5bVVtazFMRkRKSk5kWVRyaGFCK2dk?=
 =?utf-8?B?OFUzdmcyc0tuNnppRG9ZK1hJSmh4czdrdXl1YUFSUnovMWUvWlgvc3JYcE9D?=
 =?utf-8?B?QWpSWjF0Vi8wL05WK3NPek1XcE92L2lrQ2VOdXM1SElQbTE0U3VDUWFSUDBM?=
 =?utf-8?B?T0NtQ1BxQVZkcC80MldMZ3F0OGNXS1lJbWV1dWl3dkVDS3U5TEdIeTR1MVV1?=
 =?utf-8?B?LzJhMDBRR2kvbmZjYzdWSmFNMEQyOG9lM2g1YjdQTjlNVVdoOCtzZHBYaHJu?=
 =?utf-8?B?dWRMZkhBQnAzaUg2d1NkeVdEUXdEYzFJQnRmUFNmTzZKVWdSMDRpVmhBaWh5?=
 =?utf-8?B?bDE4eTI3VDRieWhRS2QwaWR0bmk4ZXNNQkpvc3BtT3Fsa2I1dUNTZzhCSjJq?=
 =?utf-8?B?K1BlN0xqMVpPUEhvVTFyQUZxRzdKY3ZIMDROalFYaW1JVlpnZ21HcGpSVG8v?=
 =?utf-8?B?YURaNHdISE0vdDRlc201S2V4QUo4alFZYTI4NWhmeEZxYkNsY0c4VjF6SVJ5?=
 =?utf-8?B?RHF6TXhrbWVCcEk3SHVzYm5YdlVxUU0xdUFQNG9JMlJpdHdQOFpOUmRiNlZm?=
 =?utf-8?B?OXUzQlBvWURBS2x2aXcxSC9sM1Z2VU9uUGdKc1gvTTFiRExMQnNwODN1a1pO?=
 =?utf-8?B?L2dBOXEwTVluemJEVlJLSXVNTHNqZ2tpeHRmeVVIenFpTUNET1puSWNBZUN6?=
 =?utf-8?B?YTBqczlJYU8zR3pqUG40b2dIWTc1UVBjRjlmUkJINXVKYzRoUkQwcnlQem9F?=
 =?utf-8?B?WEwvUDVYTTZ1TlhHS2lHRjM4NzVPZ2hiS2xyblJIa0lWS21iMUd1Vk8xWndE?=
 =?utf-8?B?eUQwRmkxWEI1UDJxSGNrOHpvK3VIMTFQM2gzdm9kOUdhK3BhTTEzTm5ncFNn?=
 =?utf-8?B?SHB6UjJTWENvalRNS1J2Nmt5RWF6MTBrMHZYY3FDUS9jaHZadjluZ3lWWTJ0?=
 =?utf-8?B?RitZQzREWDdRcVlYTThIWFJTSStTZGVUbUdxbWdqVzVNTDlzeXgzTk1sNlQw?=
 =?utf-8?B?dTN1R1hHaTdaZ1NoT0tFWU5jNDhmcHlybDRhVFJsSCtWZy92ek5kOFpMbGxk?=
 =?utf-8?B?MFI4S3doRTJjbnFBUkFDSU1INE9iamI2NXJ1ajVoTEFwUTJjYWNQRUVObU81?=
 =?utf-8?B?bW9NNUNML3hCNnBpSHdwUU1ybGZiR3JaNnRSQTV0dGFvRkV5WlREV2J6RjlN?=
 =?utf-8?B?UXlNUXRBZUZEMC8zenhycXdRb2R5THdoOTRVem4rZUFvaGFqMTlVV2ZqRW1D?=
 =?utf-8?B?R1I4MEtIOVB1WXJ1VnZMdUp2WlFvTWp4RmxXZHd6cUlKYWE5am1wenpBTVd5?=
 =?utf-8?B?ZUFVRUNhblhkS1JyUE5YNEdFV2J6L1RGcHZWSExFZkJoU3hvTkV0S1ByN3hn?=
 =?utf-8?B?NGFab0xMNVFodU9YaGg1a21MMW1WNkZ4bllCUDVwUDdsL0kvaUZLcms3NC9v?=
 =?utf-8?B?SzNkVURqYU5CL1BUVHQ1cnViM3R3YXZYMVdFd0R0eVZYdE9EWDAzVG1TUlJu?=
 =?utf-8?Q?0xfwSQOUnfUqUrHG8rXDGRVK1JuUG32ul78vz4I?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlMvTEtDcE1BZmhVTFVQSUYrNjZJbkpWSmJGTmsxWDlmandaeTh0bGlaT1Rw?=
 =?utf-8?B?MExHNEtSNHYvdHFJUVVLcGtnZUFDNGVMSXNiTTlVNVNHRUhwK1pYMkMzSmlU?=
 =?utf-8?B?YkFKMFp5eXErKytxZDRiUHBNUVJicUJEak1CSnRuT2FTM2I4Y2o3ZTI4OWVL?=
 =?utf-8?B?TUlXQ1dJWW5UcG4zUS92ZjlvV3pnRGJnUjkra3BmZ3g2Q0o2cFlpWjVrejFX?=
 =?utf-8?B?OUpkVXl1MXZOWEpwaEtlclN6SGZNQVZRblBGMVRJUHRkQ3BrVHY3VUdyMjE5?=
 =?utf-8?B?VEZ0aXFjUnZBWkFNcWdFRmR6b0pOT2cwekFlVHBmcXdvUW8rNC94Ym1WaEJW?=
 =?utf-8?B?NWFsait1YlhoK2pGNE9ESlBSTjc4R3NOcTdvcVhkNEdHdVpFUU11eFV2NTlT?=
 =?utf-8?B?YUZTR3pZUEFQem5PNUNoZkpRQlF1ZkFjeUc4RHJsTWxuSEt1dnRhQUVBeGpL?=
 =?utf-8?B?NWdhbGhWK1hRM1M1RDJtVXhhdXBCc1ZRYkdpNFRTcFdIOWgwUjdhZjZ5L0l0?=
 =?utf-8?B?M0g5UnczQlBLRWJ0RzIzenA0dHBBOE8vaG40blpTK0draXRYWEdUSHY1QkNP?=
 =?utf-8?B?eVlYTDl3bFBDZHdqbkxvdUJuL0Q5WW9SZUVrNWkveXRuckQ3MXRIeWxLTlFs?=
 =?utf-8?B?ZzhrYUV1alJKVWxwT0pkVllWVnRSa0txaHZWdGRMb1l0QTRJM0p1alFFTTNn?=
 =?utf-8?B?VHN6b0xzV1U2cmJPQUUrSUtkRHIwanVMaC9MbEhkQmIxUEZiazVxbTVqL1VE?=
 =?utf-8?B?ai9yRTNqV2FNZ2VZTXdiS0VhR3g4eHA3ejJkQys5TTlEbWdBWmdZZWdmWWdV?=
 =?utf-8?B?TDI0a1ZKVUEyNFBPMWpyR3JxbVc0UWw1NVVCbnZpWlVCRkdDUm5iYmdpMlB1?=
 =?utf-8?B?VnZKaEZFSDIxUWF0VUdISkZVanI3QXdmSmUvR2NYRVhKaTNqbDdicm5pOUlF?=
 =?utf-8?B?Yi9xZnh6Ujhqd0ZsaDVBQUM4dVBVT2Y3TFlTOG9hd0hDMDlCN3NzUjgxMXVZ?=
 =?utf-8?B?dlE5LzJRYktFYjdldVhtMU12V28zUTRVQVpoMWZXZGp5MXhscm5OOGh4eUEz?=
 =?utf-8?B?T2NHdk51ai92Uk5ya0lJUlNSK1RNS25qOGliM2JPY3NWZFJJMVNkWFBvWkd6?=
 =?utf-8?B?TUNtbVdVWVhIRmp3VDluc0Q2bWlvTWs3VjdUazhHWjkzMWt1VGRoNm0xNWtt?=
 =?utf-8?B?eTVwbTMvY1pDSDlhWGVWS1NsUW9jT2hUdUhBY3BWS3djWVNyTUkrSXA5VFlL?=
 =?utf-8?B?T1JHeitZeVZwd3BJWGVpUFp0eitiUS9RMkJNcmhxNFNjQ1NmeUVrY3N1WmVF?=
 =?utf-8?B?QW9BcXpyckIwQWlhVWtxazQrbG5qa2YrY2tTczdCbWt3SStDN0swcHVDRHE3?=
 =?utf-8?B?czFaNnBoejk0VmRKMkprQWs3ejhGazAvMWhRT29HQUpUbFBJQnNlOGszK1F5?=
 =?utf-8?B?dXR4RkQyQUdjRzBiRmdOYkJFWUZ5T1dobm1sSmNIYUpDYmtzRTU1TWdtR1pL?=
 =?utf-8?B?YU1CTDVIck9hRzZDc1F2YldMVk4zN01YbkV5dW9QSi9BalNtVXpqMDZHTkJY?=
 =?utf-8?B?SzB2RTdRb1loV09xN1JXdVUzYy9rZHhnNW1OSVVCL2tkOUkwOVBzWjJIb2V2?=
 =?utf-8?B?aGxSNmp2c2t0RDh1MStyb1hsYUg4S0NRQkFjZzVEaUdkUHc5QnB6eFhCYi9K?=
 =?utf-8?B?OTUwc2xNdVRKRnRDNW1QaFVFdExzaEhzMHBzYWlPd1ltTDhGZzF6WFlLd2lw?=
 =?utf-8?B?NWtJeUhtbGMxNmlHZ3dKaTFnc2NjclRhRURhMlZJOVNZL0Q3bnhMRys0Uzk5?=
 =?utf-8?B?RVpoTUFvb3h0UFNERjEvWmVCMlBLRVI3cWp4SlQ1K2dwYVFoTVM5NlMyMFJx?=
 =?utf-8?B?dE13clEydFJLaVAwbDdOSEpIWGtYckwwV29kZWpuTXZnYXFjWloxT3hkYS9G?=
 =?utf-8?B?ZVQ1a3Fvd2c2UGFDWHBpU3lMaGRySVFaS1Jhb1gxYnRaN2ZYOVRDQTE2UWQv?=
 =?utf-8?B?ODlydXVKUVBHVk5sa04vWjZMUjQ1dnJydnFQQ2Q4UFFxN25mTmFFQzg5ZFRr?=
 =?utf-8?B?RW5YOWZEMXlWQ1RJZDg2VlNRSUdWLzkzOTZlMW1rLzRpQW1zVzVjM2VjZmZy?=
 =?utf-8?B?eWVkOVNyMk15emxFSFgxVWV4UlUyaDhvcDdFSjhEYXhqL2dKL1F3OGl2empy?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 422f97c1-7401-475b-5452-08dcbab3cee7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 09:47:43.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ua4A+LUHiLmq0KZBmQ9jIZhiiEuRHAUr8KnLB+9fOUdnm42Rua1+eLld5wDM2hbHxHdCp+DAG9L3Q+VSA73Ze5F0+JQQjhtmXKUJtrgatZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8086
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Aug 2024 09:47:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5334

Hi Jan,

On 8/12/24 11:03 AM, Jan Vermaete via lists.yoctoproject.org wrote:
> [You don't often get email from jan.vermaete=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 

This is in OE since commit 704b01f33196cfdeaa57e2f2602ff2d52b25ab93, 
present in Gatesgarth. Therefore, @Alex this matches the criteria for 
backporting to currently maintained branches (kirkstone and later).

> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

