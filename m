Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5DCC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 15:14:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.67])
 by mx.groups.io with SMTP id smtpd.web11.25130.1743002081740781194
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 08:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UsC2cDFk;
 spf=pass (domain: cherry.de, ip: 52.101.66.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1+LFdZJThjngZ/ZgMnMYIpmEi+wGNmo4nk6d/K5jbO7W2ps72PuTJx9cpWBJ8K/WagXQ0HNcxihJfOc754VMf7YPgolihdCID/rdssxPtP74BAk5gzFH7QmorUsx7C1dBLpq2IfKQ3HTHcl9aI9hR09rtJ+C96/wul5TQJS9QX6altXldQzRZBvG59iqU0S+l+8+5/nBghQoHG+vNHNlu8865HsLI/AiNyu11pjx7ehwTl7ocbazLwzE+NfuRvU9sa8JXciV5Y9oCfhb4wHZH/3dxod6V/cXqR4ZuedPljTyFVzhjw5D8FbGv2KjB9PGz4UDVW1BUU/SUpAWmKw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm1KfhYCn8liXR5POH666QEbJ8iPJoomP6NKfE8+AnU=;
 b=SN8Cz1euVAMQiKaXMlzYV00HX/nNnmFyBLMnP/p4o4tBHgYM8ZGTjp8JOSNVkW52pSu9/6ByGZpp7b+8X2Fpcr+4lXtaW9ft0EefYodulPt35xQ0sNCWSn0FQwcAxvN/eDL7+GM6pVWMHuHYBjxGqQpStfj4x8eqw2L3m92BRk2dPzS7GnvSKI4EoFo+BQ8sOkJHHUh0hqXoH5LSg/JPYBFgd2dIuZtehzpnntoHfjdqixHqtqCKZLEoPPUlh9y7ihk12BE4IEMwNbczL2NUPHraVag8MEeLOPbIAjYtzGbggqjUeeUEXL1TOSnsYy/VPynHR8kWS/YLrxDjr8DWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm1KfhYCn8liXR5POH666QEbJ8iPJoomP6NKfE8+AnU=;
 b=UsC2cDFkVUxPHBhsT4uJKyqdVvcJTyhgX0VfHDtvE+nVIdsAN/xomfXdBCHOeE1dyKh6ZhSt2oHFbckbdAKSFQzWgCTBqRYTJeROfEUNZy+4akHT5o6gMBPgWahSaoU48Fo9koQrYAyt62OV9LLBqDcDBLiL/APDvALqVpraM8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PAXPR04MB9218.eurprd04.prod.outlook.com (2603:10a6:102:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 15:14:17 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 15:14:17 +0000
Message-ID: <cd5e6004-c141-4e4d-8278-ad30464cb5b7@cherry.de>
Date: Wed, 26 Mar 2025 16:14:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 4/6] ref-manual/variables.rst: document missing
 SDK_*_ARCH variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
 <20250326-cc-vars-v2-4-36b80c64c4a9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250326-cc-vars-v2-4-36b80c64c4a9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PAXPR04MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: a07e252c-b9fb-4a61-3a83-08dd6c78e084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUZZdnU2STg5RWo1Q2w0TU9BdllONGN3TDdNOXdOd0tQL2FFTDhwSCtZQmdz?=
 =?utf-8?B?L1oxcE8rRmlHTCtsakRpaExVWDhNR3RNTis2ZUVRMmNhQzR1T1dodXBsWEQ3?=
 =?utf-8?B?UVFkNSt1ZTV1UlM2VHMvSjl1aVY1U1o1VDJ0M2VHTVBhMno5TWlNbUVpenVh?=
 =?utf-8?B?bjZ0VkQ1dnllNGdXaThEeGtjVlQvTU10UE5HWXYvNEFoNldNTktWU291Y3FM?=
 =?utf-8?B?dVZPeDRXN0pIeXExM3BjeDM1T3VibmNWb1NaRTlERmlBWThxNWRiK1ZPUUha?=
 =?utf-8?B?RCtxcitVbUdiMFJzbnJrckZKWWt5TG01RWtTSUtQZEhydEpubSthU3ZPUUhG?=
 =?utf-8?B?U0Y4TnRmTEJYTktFNE9kU0pTTVZXek8ydGJ4NVhsYzhQajgzYm8zZCs2UkNR?=
 =?utf-8?B?d3pjQ2tvZUV6emxXWUdoOEFhR1RLRE1wd3FLNWNVL1psMk5CM0lKM21vbmpI?=
 =?utf-8?B?Y1hzSW1uY1ZjZ0JERmk2Y0JMdmZKeXBBR2s4ZVhDZ290UVBWWW8zRFBORUk4?=
 =?utf-8?B?S3JRYTlYM2FFWWRpUmNNeGZ6eFZhd1BYKzBnQmZ4enZjQkxMbkR1OENVRTBy?=
 =?utf-8?B?K2toMjV6bnB4dytuVXJuU2JoOEY1a3AwZXJGcFpWNzUybTNHcnRVaW8vWUhX?=
 =?utf-8?B?NjZhM0pmQXdGMUpPRHRJQVcyY3Q5RnpNWmtDd3BrVFI2RWJjWk1kOHlJRjkw?=
 =?utf-8?B?bUo1ejdtQzNPbnFjdGtWSWlxZlBzcm9lWVF4N2Z2M2NRNFlmSDhPQytVUGxq?=
 =?utf-8?B?K25KTm9kbGNxQXh0Wmg2UTkyWDJyL3IyVFBZY3dzbWFvQVpUcU1jVEcybXNn?=
 =?utf-8?B?U3FUSDhSNXNXb3hnRnM0T1l2VGU1a3ZySVhhNjRZb0hhKzhSWlFPTG8wLzBy?=
 =?utf-8?B?RklaNG1yOTBVRm01WkhYQ2JRQVpleGdUdGp5SlI0SVV4eXN3d3JmQkZxMk1u?=
 =?utf-8?B?TzYrTHFZOGFmKy9wa05ZN2hiZEZzcFpIZWNHc2UxSU5yNEo5SHJldkRCZEgv?=
 =?utf-8?B?S0hqYVIrMExSeWpKVFVnTGptbDQ3LzB2b2F1Um4wSHB5Mmd1d1U2QzBCNXlm?=
 =?utf-8?B?V3luUHV4eXM3S2QzNFZIb2hFcUVEVittK3Z3eVRDQ01aNTc1eEUwTzJ3YkRi?=
 =?utf-8?B?aHJKTjVYbVJDQzJxOEtOTTRGWTdSUFRFdGZVNytsL0Q5cFVlYzFudCtFS2JP?=
 =?utf-8?B?ZktyOVlFSHFDY3hkS0QyYUZjTXlRMG5RWUl6eFZRR2NVcE90ejFnY0V0dk1W?=
 =?utf-8?B?NU9JMFFYTUtYY082aTdaL0p3WFdRam5Gc2xPU2ZUTnZWUTJNL25KSVZuTHE0?=
 =?utf-8?B?ZDFsdlhXQlg1eFB2ZXNrTFVnTStqSG1vWG5Qc2ZLZjdPZktHbUxmN2hySUR6?=
 =?utf-8?B?RGZWcjFUMC9uOFZaODZXNFljWE5yaG1URUJhU2tscUJpNnEvSVRiMjRNTGw1?=
 =?utf-8?B?ZmJZRUpjd2x1VmZkNDlSL2F5L0QvNi80M1VRMmRJKzc2T1dMQWlmNUxSZDUz?=
 =?utf-8?B?RnR1R2xzN0JrOEF4SFFzRDVhdEptMFlHWDNmd1k0Y1ZwdFpQQnpsdmRrRHhB?=
 =?utf-8?B?NDE3SWg1c0dra3dibEdENkFhNExYTUFXNTNGWjZGRkhQWWNLR01FR2g2cTdq?=
 =?utf-8?B?V1BWL0V3Mk1VSUpPNDRZL3p0VlNsLzl0Y0hjQmk3bUtDNm9PNnBqU0lQNnlU?=
 =?utf-8?B?SXZTWkM5cmRnWVZQQU1iOEo4ay9raTBZN2NZeFBDa01tb05iODhaYWp5dUJU?=
 =?utf-8?B?dlFDOGtmbGcrWlRkNHJoZlRyVVJxQmhKd1dhR1Y0TE1xT3YzeW8vQURzTFRI?=
 =?utf-8?B?SjVoN0FtdkdBdkQ0ZG1sZThWZDd0a093ZlBHZmxMZlZiN2cxM1E0NCtYdlp3?=
 =?utf-8?B?SXJ3ZGtBQkZDemxQVDFSQXJTa2N6TlFXTDBZU05aOXEzNHZ5ZGJLa1BNWkZw?=
 =?utf-8?Q?8m63wI7rmqw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVpJVkpQMWZ4TlRzdjlrWE16U2Q4K1phRFB4QmZGQjBWVUx2UVBId1dHcU5F?=
 =?utf-8?B?R3kzZE9vc3BmbWVQTGd5dndkYTZVazZuamErWkx4VnlFSTFTWVFkZXF2RkhL?=
 =?utf-8?B?WkpESEI1M2RHWElnd20xWExpenFaRGtVdHhoK2hqRjJ2WENPQkhhNkFGTUdO?=
 =?utf-8?B?VmMxemF4M0llYkw3ZGNzTzBhbzNOTzJmVkdOSmlNVGswSktRRlNqakFHczQ4?=
 =?utf-8?B?eFdmcFJaRU53RjFBcGErYVhFQWhmcGRFcmtZRHpTS0FqUk05eUhpOTI4eWpF?=
 =?utf-8?B?UWk5ODZkS1lsVjlVY3ZHN1p4czFoVjh1cExMRU1hQnZSTE43bXJrWXAvN1ky?=
 =?utf-8?B?dGhyRElnM0owaGNySGNkTEdrcU1NbWRORUJ1UDNibWhlZHRBUEQzckhsV2dU?=
 =?utf-8?B?cEVLRmRWU3hwcWhlSGo3Z0ZLd1BlUWtYVWpjNUVoRFAvSE1wR1ZoTWtoYjJX?=
 =?utf-8?B?UzBXa3lPTG00ZmxWMmx2dDF0QWgzODk2YUdadW5sUTBnQ2NEenlIdGFyaDZC?=
 =?utf-8?B?d1hHaXZqUjIyT2R0cjFFQlpWVXRxYUpFdWJjK21TcUZCUEQ3SldxQ2dxNEpq?=
 =?utf-8?B?TTZUM09IMnNVazBlZlhPL0ZjOHBOaFJpNnRqSkpzL0hyTi9PekUwMU80U29x?=
 =?utf-8?B?MGVRTUtUYWxYTDRvRHRCWjh5Ym10WHdncnNMd3NIbnlXYmNMU2h4NEJJNmJo?=
 =?utf-8?B?OFV3aHExaG5KaDZzWlo3Z05vbTkxOGhBMTVvaG5UdEQrNjg4ZGkyS3pUU2Rr?=
 =?utf-8?B?Rmt6VnBwYm9RSVpVVVdxcnZGNHlkZEFHNENLZWx1U3FicmY4RFpPMWlSYkJ3?=
 =?utf-8?B?Sit4SDUwM3V1SFlDSjNrVFdLQzhQQURVUVZuRkttTUlqci9RS2J2OUtsV1F0?=
 =?utf-8?B?V01NLytuWTBRdWRSVGhiREEzN3JvYjNHRVpGeHdlclV1d1BzSVZQczRXSW90?=
 =?utf-8?B?Z0ZrZXBFeS9QbCtQSzVmN0xpWGJ3b1FvTWJ3Y1M5bzlmMER1d3NQYzl5MDB2?=
 =?utf-8?B?ZmR2eTVWVmFGeU00c2huYTJIc3JCQ2hNQktYc0FwdnN1cFRCcGF2bmpnNFNH?=
 =?utf-8?B?UWRFcTFXMW9HVTUyMSs1WGI4VDhjaFVPNkFxQ3oraFAwQmxlUnQ4T2JNMGV6?=
 =?utf-8?B?OGFGcDV4UWNMUmNsWXFiRlNENjRBS1pXaDZCNkxMRmVoQU84dHlQbzZLbVJK?=
 =?utf-8?B?MjRQUW1aZ2xRM2pEY0NEdnUzU2xqb1g3V050M2ppUVZRN0hrVWMvc0VHbUhE?=
 =?utf-8?B?c1dQMTNaOUlPR1BEVHRKVUpBY1FubTd2MVg1VXY4azZPdThqRmJyZG9WZTdz?=
 =?utf-8?B?QkJWWUhoQXZXTDY0NjhEVW1kOURxczF3VHlnL3VGNml2VVFlNHJDdE9jUXky?=
 =?utf-8?B?VzN5MjBpaTlFTk00Z0dxTWpacEFaWVQ4RjJsUHFycXZqWnB5ckFxdThoMU5u?=
 =?utf-8?B?Z0o0djJIZks4R0hCaWhrc3JMTkpIK0E4cTh0MU5zOGNhZnV5cDhkTFNtSS9C?=
 =?utf-8?B?bHUrTGtLczRwRzFsY1RhMVUrMXNoMGwyaGczRnlMOWxOa0p3d25ia0dwZndy?=
 =?utf-8?B?RDNPMUFQZE5ETG5MaVY4SjUzMnV0Y0JIY3U5WUYrSndpNlVrbTl1dXJuSmxB?=
 =?utf-8?B?ZWYzbDQvdEp0aTZCdGJuQnF6M0VFT0NuR0VZUmJUU1F5M2lYMzNyandEOGZ4?=
 =?utf-8?B?UnlWYUZuR2xmaDR3TExSU3JmcEJwWUdYZHlKZHMxK3VNeUplM3o3Q2VnZ0oy?=
 =?utf-8?B?Vk9NNkRscVppdFJlQ2R1NDlJME41RWFCSWhtSytMTko4TEs3VGJydVpJRThV?=
 =?utf-8?B?RjJsTDdMMG5ROGs5eEtqdENMcUpUNS9kOHFzU1JjS0JISUxRWnJYajJ1Zzg1?=
 =?utf-8?B?SUsrS2pzZnh3eVUxNE1nN1hLRXduVGxlQk96bXBsOEJ6bWNkM0ROVWxDT1dC?=
 =?utf-8?B?RDZMMnJPNngrMFBXVXVqRXE1MW96TmxYS0JBZHVHMDNMenBQZTIwb1Vad3Jk?=
 =?utf-8?B?dkNzT0pGd0VRQzJYdUhVdlRjbVBzcmdjTENNL1pQMnczZjhKNG9nRGxkaG5G?=
 =?utf-8?B?SThlOG5URTJQSjlBT3BLY3lGVzErY3M1WHc0dmJIaGhIcTVPaFdQaGpPVEIw?=
 =?utf-8?B?VEZnWnQ5NE8wMzBudXhUZWExdldMWlJ0ODEvUkhOa2pCUHlsKzlWWmVua1ls?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e252c-b9fb-4a61-3a83-08dd6c78e084
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:14:17.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23f7INQnVImFi3zAbwuEdhPFoqohlCx+kO/sQFBbgiX6nSFGfvE8n/p4pOMcO17wGKqxOf+Mau0+r7GUSGvl7oAP4M1IVH4RAn7OkfE3Vkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9218
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 15:14:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6644

Hi Antonin,

On 3/26/25 2:21 PM, Antonin Godard via lists.yoctoproject.org wrote:
> These variables control the flags for the assembler, compiler and linker
> when building for nativesdk recipes.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

