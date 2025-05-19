Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5099CC54799
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 12:31:54 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.46])
 by mx.groups.io with SMTP id smtpd.web11.49774.1747657908083568083
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 05:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ar2Jw+WN;
 spf=pass (domain: cherry.de, ip: 40.107.241.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJEClyjSJ6SVA7Zlz6XA1fKP5afSuZAIvKEtFqES3o9yjsHDc4QsLSxmii5sxAsZ/uXO0eu5VyLYsm2KaD9ebZZsfTKvTb74v1t5Dx/5aEoDPOOoUWmqlMwxyi9gode4fnFFz54eFNIKxNhJSgayCm/r2I6+KuoJ3dO39TMTYhboZ+DlmJ23MNSzMrQy8AgPY6DcOL4gboHjCqqu5KL2j6G9ZGE2YuR6LxmFYN0NGu/uSfa1q003ylt1pHxzp5DCeMGGpWaE+xYSi0W/2UHXMzD8QOg2Hxxg8QJplojIvhykCx7rpVbrR+pbjKh5VbxIsDLfl+AkReldDd6x46xHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNRlDpDjhf45+ps80JTI/sUmKre/g7vo6vsvo7FIXRQ=;
 b=oTyuivA9vuzu6Yi/kaT80hAEOjb2NIdD/VI+oK+rgf3xiLi2J7z3hT4Qsn7Z2sixe2G4wGoLzVEhU1hohMx5YX96EsQte2kCmRpRwbQ+MgcpZkJsyV+6rs+68yb6C444H+LHkwBnchngrQ+3tV3fr8alZQ4wtyymZ5ScDGB2AqcPh8Ym9h4sOcnugLJyGf2qsbXlBzpQgwTWR1sqKvcnxtyEjkimzV3ceOrDl0nNlxdTixAIYwvXI1Akh76IQSghrkUtdT/DklKbnhiKlmbbjMDdMwY3+y4Wfe3QnLHWp2vbeTRxzptYkyJZH/ETIFMlFfzUP1zB6OPZzjHapr3IeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNRlDpDjhf45+ps80JTI/sUmKre/g7vo6vsvo7FIXRQ=;
 b=ar2Jw+WN75H80PRpB4z049PUivXEahqO11q4h9ZThnyWVEER+VgGzNf5DDcaM/8vM9DtsoT2X8x17uRnjvKtaOdmEFvy5TDMPaGRiR05TwvJ3vHE9fz3pNxTerZ+Wpb3UyXX5/ZWu9Lun+Z7JxE1deyDZ7A6TWll467WKU97sx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6779.eurprd04.prod.outlook.com (2603:10a6:10:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 12:31:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:31:42 +0000
Message-ID: <be59cf0b-428d-439e-9b83-11c64fdb03eb@cherry.de>
Date: Mon, 19 May 2025 14:31:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual/variables.rst: document
 INHIBIT_AUTOTOOLS_DEPS
To: alperyasinak1@gmail.com, docs@lists.yoctoproject.org
References: <20250519122825.63816-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250519122825.63816-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: ff374c2d-7c0a-4f61-92d3-08dd96d11c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MXRjR25LRGxHczhpc1o2eGw4cStuTGkzWWFLNFZmYUZYZG4yYXlia2ZpS3lV?=
 =?utf-8?B?WVhaVVdIMWU4NS8ydUVKZ1RsaDd1eHErSDZKVVNQTjRnQVg0T3Z0czZ0YmVL?=
 =?utf-8?B?T1NEVEhnekR3K3p0T29XdjZqckY2UDlBS3JHdXh3dWNrekR2TXV6TkRVVWJP?=
 =?utf-8?B?Um9XZDZRSGU3NTZSc2M3TzNPNWl1ZHdXMWY5RGMwYWU2eGwxOTVRUitMYnB4?=
 =?utf-8?B?L25yWkZsVy9rc3p6TG9SQld3c1JHMm1qSkU4c0hPT3VudDh6cnY0VEVnYnRB?=
 =?utf-8?B?WERUZzBlcmhUaHNkOUgxUzNPbm5vWklMOHZwaDNFaWJWa0J3aHhHT2w3SDlJ?=
 =?utf-8?B?aHFlQm5OUTZocXFvZXhCdjh0bUwyYzlNbTZZckQ3WUU4azVLL2I2ZzgzUmZM?=
 =?utf-8?B?TUlCbEhSUS9ONk8vcFlzZGRyTzdmbkl1VkFPOGw2aTlCTkVMOEFqZ254L1R3?=
 =?utf-8?B?dDdqU1A5NVBYK25nOWZwWmVySTVqTlZhMTdKNGJ2eVA4enRydU9ObG55NVFj?=
 =?utf-8?B?cXRreWM2RkRyNXhVeVhwVVdmLy85ZHRiVjlXMVRaMnFScFB0SkZnSHB3aFQ3?=
 =?utf-8?B?WFNYR1pqaThTMWorUGxMbXJ2cFlvVmhVMHpnOVJuOFBpV0ZjTkN2ODBWU1dB?=
 =?utf-8?B?MUoybGQrRXRkT3dUYnlpem1paFR6cTU4c012TWhLQ011bTJ1OGp4dVpuYy9p?=
 =?utf-8?B?TWNORWpjRDc2T095SVNEM3FBdEpOTVNIeXJoVmdCQVFvZkRjSDIxRWRoT1c5?=
 =?utf-8?B?YTF5SnFFT1A0SUgrMG5ISGRiSEpSazJYNzZVQ1M2YitVN1hjTXlrVWVHc3Nk?=
 =?utf-8?B?UEo3UWxZa2kvZjY5Rkljci9qQWJLYmRZWXBwRnN3Tm9nTW1JYzRjTkhlZllm?=
 =?utf-8?B?UHFUaEs3VHVyMWxCNU1wZ213QW9CeWJKTjlGQmxPaDNqb3VEZW8xNDYxemF5?=
 =?utf-8?B?QXE0bXZuZWpNTk5SWnJLUHNOOUNDSnFWNUpDSDZTY1J4VHBIWk9oVytqN29L?=
 =?utf-8?B?SVMvcm9BRk1kUXFmRm5JUlUxeHJTWHc3N1k1VnZFT2dCeHFhQTJvYldzckE1?=
 =?utf-8?B?ZjhqZEpQZllIK2pyeWlCSVRUU1BYcHpjUmJlYmRISStnak5CTUgweUZuYnpv?=
 =?utf-8?B?Y0FiN1dJZGhocVNZTkdTa1R3WEVJS1gydHFsMmZiV3hkNmNWL3pXakovSXR4?=
 =?utf-8?B?aFZCeCtlcjNrUnQ2dXM0Z1dTNHg0bnBjZS9UcHJzQ2ZDSHBTaDkwdHZFTENk?=
 =?utf-8?B?U1lSYWdqaFEvMUF4aE9aT1I4VzZvVVFub2VJTkxZenJHL0syYUxJSE9wRGRm?=
 =?utf-8?B?ME9iQURGaUo2Q2d3TnNPTjd0Vm56SzJYOU9WeXBNSlpXei9nS2dmdTRaNjc1?=
 =?utf-8?B?OVpLR3pYYjR6eGxvYy9sS1FadkZ5bWg0MDhFS2QxdDF6OFVsRlVmeHVTNzdr?=
 =?utf-8?B?S3Z3bWJXa3Y4L25ZUVJqQ3ZISnc1T2wrakVrem9iQUwreUhvcW4yS3ZUa1gy?=
 =?utf-8?B?NnNNanZSRVJQM2VNN1A0V1MwRW9hN1VpY3prZWN5ek5KQnRVbS9tRTJTb1hR?=
 =?utf-8?B?UDNnYWh1YlVvZGRJejB6YW15dkljSkJKb2JCUStYT3ZUTmxabVpMYnExelBS?=
 =?utf-8?B?UFlheHMyMUFod1lRRUYzRHc5T2plT09DbHVJWVd1UUxmVGQxL1c2NTVoMkNW?=
 =?utf-8?B?U2tRMGZvcVBWaURlYjJTWE40R1ovcVk3RDR1bEVLUTJrUXlJMk40em00MFdJ?=
 =?utf-8?B?bDVOV3ZFVEJQK1dFQXpuYm0vNmZ4RUU1MS9tanRIY2pVQVdORTBzV2p0QmhF?=
 =?utf-8?B?NFVDNnpnT0lMbWp5TWMxMEtITGh2Ymh0Q1hUNm1tZ21pR2FyQUhOeVc2emVs?=
 =?utf-8?B?eUdGdDZjd3Zad1BuTDI3SnNkdERBckFpYmhNemNrRkh2TWg4bkpEcWsrRTlG?=
 =?utf-8?Q?ASzYuZfxpJo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjQxQnBYdlpKdGNiY3RTSXduaVBEMXpZZ3RrWFVzeVFmSmtkUUZ5V2oyci9Q?=
 =?utf-8?B?ZG9UM1Z6bWZ6Nkp2d29YREExMkN6NFVETWZ2eUpMU01ZUUxXb3R1SlFZZkI3?=
 =?utf-8?B?SVRKSUdkY0NEY1A0WEgzUXcyalZBdHdCc0h5VmplcldyTTlBQU9mOFNGRTIr?=
 =?utf-8?B?OWlXR3MyZUlWZnZVdm9QaEExcmliUUZONkdMN0lpUzc5YndvajFGeGZ4QlBt?=
 =?utf-8?B?ZlpJY2ptak1vVzlxZEN6ODVLTTN2SEw0OXB0NUZJL3dPbzdBTk1ydUVLaUZK?=
 =?utf-8?B?LzN6MWkrUkNTdjUvUkQwUGE5aVJGcU9ZK0RBYmErdmpyMnpmbXYyaWl0MTJa?=
 =?utf-8?B?dm9vN1I5UGErQzZjNG9MRUIwUkJRNmc4cUJFb1JKYzMxTm9TR3oxTlFnUjh4?=
 =?utf-8?B?MjlGNGxNLzd6R3QxWVJyVGZxODBtVGFYTFdhWE5VY0Z6bWRvRjcyaHZzVXI2?=
 =?utf-8?B?Z0dINEYvMXJKbUxPZzAzS3RRTUZnTHZwcjlxWjVpbTNSalZBbHBOWUhyTkxt?=
 =?utf-8?B?dEt1SVBGWmF3Y1UvS0lwUUEvbjN4N3U0UXZhSzN0bUZCMVBGVVdVcGJzeGpo?=
 =?utf-8?B?VjZXT0FsQ2JNVGJoM2hxREFnNmRzNEh0bUFsS0NPMjZsSzUra2d6aXpUNmEr?=
 =?utf-8?B?VVF5RDRXV1VOTVlvMEJ6UFo5T0ptbE5wTEx4RWF5Q3Z4S2xxMDhHczJQV1l5?=
 =?utf-8?B?WVk2R1haeG04U1dXT2FmN3BRR2hoaWFtYmppa1lQUmhVd0gvQWQyOFA4a2JT?=
 =?utf-8?B?RlcyVmhRUHdxRlpqNVA5MEU4WXBsb0huUnNaN1hSenJGdXo1cm5ldmptcTBm?=
 =?utf-8?B?WENoelFaa0RHa0UxaDFzWENCaE4zQnJ3bmFyQ0hWaFUzbFRZRFFkMEMvK21x?=
 =?utf-8?B?VVZ1QXJKTDRRenY3Y05kK1dLTVVPTjdRTngvY1MyR2c5aVNqemZqdW43MlA1?=
 =?utf-8?B?MFhpVG5WVkQ5ek04OE10dUJZTW93c3owVlByTlBHWFovR1dLY0FLVnB5OGhU?=
 =?utf-8?B?UUJkUUhJZGJ0TzVnWTQrd3RhUDRBUk5IeG80MzAzb2trbUZIVDh4QU9LYlZj?=
 =?utf-8?B?NmlIUGp6aG1IbWdsZWdVRG0wb3ErQzRHc3BWNVgxcTFLdTFIb3k5TVlnUkJU?=
 =?utf-8?B?bFRHZXZ4MTlQdUhmL2dHZkx5QVAvMWxzZjJiZ2tnaDdXU3llcTlxVlNPckoz?=
 =?utf-8?B?SkhkSktxbHByNjRobjJyK3VxckhmUzRIRCtMMklBRWFRNEQ5VWdTTzZzall4?=
 =?utf-8?B?dW1QZmhwcWFhZC9OM1NKWEp2NmlHVEp4K2FRNTRybml4MGdqVmk1VzlqdUdk?=
 =?utf-8?B?MkJ5UVR3cDdObGpOSExJUlFFaVJGejg3ckdPZEsza0czbkE3b2JRU0hNemVH?=
 =?utf-8?B?VFA0Z1oveVhEL1FMKzRpUUtoQnl6UmVzMnlDR0RncUVaZ3NqWVhOQTk1Z2Fo?=
 =?utf-8?B?MXNMZXhCbDBGNjR1c3g4Umh3ejd1aVgrS0pMYmIrS3BPL0FSQ2luYWdSYVRr?=
 =?utf-8?B?SjRzcy9kVm5Db0RlNzlvcEdHYUFTekU0MmhraUdjZE03WGFtZ0FDb2h5UEFv?=
 =?utf-8?B?cjJyUUJmeFlUSDViNm5LYzVKVUJOcUZvd2NvQnhwakhWZklHM2Zac2xMdWdk?=
 =?utf-8?B?R2pnTnFOVUtUeFZ6TVB1YnBEME1XOEVoSGZpRXAxUmNqb0p3NWtKWWx4RGRr?=
 =?utf-8?B?Qm9BYStHUk1tSWllWnpCeTZ5dFlmNk5HRUVaRmRmRVF4Mi9ocGJKVTlBbjVP?=
 =?utf-8?B?a1NRZ3FUR0pGQ2lZb01Lb1ByN2JYTTZyaUhyQ1VjaE9OamdVYThEZWU2dTNP?=
 =?utf-8?B?OWl6blMwTTl0ekMwby9HSzRnZGl2b1NBa1k0bGJScExJT09JKy9WZ3lPZnBC?=
 =?utf-8?B?Ymg0YXpyV1VuMkxpTlRjcU94d3hncWFWMmZ2UDV0bjRTZjQ3YXNyR0QveFJo?=
 =?utf-8?B?STF3K0JianA0eDRwR0ZJOWhHcHlOQUlMWkVNVU1KYmpYeStVdEc2RXJoWUY1?=
 =?utf-8?B?ckdGVllYNHN5L3VjRXF5bnlMRnRRbVhuTUM1TklxWGhoZDRXODhsTlYzU3VD?=
 =?utf-8?B?SDBPeGdIYUgxZUpxM2lhVEZXSG9FZFJ6VWlCSXk5dnEwVGRWNGdTay9pMGFK?=
 =?utf-8?B?azlFUjN4MnJNcVFEVnFHRkNsZkZIL010TGRjaTA5UXZmeTZaSG94TjRDaVNw?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ff374c2d-7c0a-4f61-92d3-08dd96d11c5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:31:42.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0GOuKT+pI0k8k3l77/qIjn6vlAehFlp4x9SL8JnZBDyFDl8Qlii5uGdJDFyoqzZI8J8nz1Rs1XyBEpzVsLXusIUSQxCzd4SoqWyfP0y0EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6779
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 12:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6842

Hi Alper,

On 5/19/25 2:28 PM, Alper Ak via lists.yoctoproject.org wrote:
> [You don't often get email from alperyasinak1=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Fix [YOCTO #15756]
> 
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

