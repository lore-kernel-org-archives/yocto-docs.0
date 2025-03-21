Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209D2C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 16:29:11 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.66])
 by mx.groups.io with SMTP id smtpd.web10.4176.1742574545315538546
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 09:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SSg9aLkJ;
 spf=pass (domain: cherry.de, ip: 40.107.249.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ3MUeRbihxvxHK82HkvhJHacOUnRQExx+s5KkTHgFSIKdJ2YxF/vJdbVMdCMpLGlA6e+baJQFcjAueqE0U+kMzWUEDKrY0rz3VZjCNoSyIrl/WsxCcPijXIXOXprtCBBBSX+1BAxsMRwWVjv8KOa8jinG9OQPXDDbYC2HQ5Sz2EAjxtqgcDjZ2du64b8Dxdpkz1e/khNFID/OnXsHtY8sGQXhyQnF60/uPgJBnyAydWq2VBC0t5UZsIc3iDoO13erhEnV7JrjVViBslJ2f3UtQiiuiVP7CSrelZRxrheNFyQtJ4AVfW5r0Icc/onVdTz95hf01pIazI9DEfCzwPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYaZIl9jiu3wR0im35PS5SFQMNcEeT+Be/F3BIC8nNY=;
 b=UpFTviQP2J8Bs+68odRsKtecUpZsX4CExYCdBliP4SrEzpAke3WD48BcUmj2kD5irHSFpe3o4X3VJZwBzWQAwX8SfkIfskJGC27+t0iK1XQtAcmDitNsEM8tU5acJM/WohdwmZtT1VF1Xi3+t49paoxJmf1apRlLAX5hIbfZbAiN7sNiJ8zUTwmk/HkX8NBdIXxEvvLbrxTxw5FGdqn66qAfzqhiiTJS/I+M19ySx+HL//hEhJMWguziFU4g0gpiM1L917ScuzxzH7gbPeJYQf1y+Lf1D1l34Zd5jaMWpPGaurFr1SZzHgkIFJJpjssCRqlKWJVYmRIXM+y6LujhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYaZIl9jiu3wR0im35PS5SFQMNcEeT+Be/F3BIC8nNY=;
 b=SSg9aLkJKOY1x1FtKm5aJo233+ca7BUmR010u+ze2wYYpFAm4uL7vR4ESfrCHJiGsNYnq73sGq5+6tY6wG3tEjnw4b8K6RF/PTIY8Xjr9ibL436PjKcRE6BlrNghmKBqgL8Y6bNonFSixzkj5iTSIXFuzJQ8u4YO6rRDgMurO+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 16:29:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:29:00 +0000
Message-ID: <6d6b57b5-03d7-4b64-8a93-3d538e1bc1fd@cherry.de>
Date: Fri, 21 Mar 2025 17:28:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] ref-manual/variables.rst: HOST_CC_ARCH: fix
 wrong SDK reference
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-4-25edbadfd054@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317-cc-vars-v1-4-25edbadfd054@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 70042e95-04d3-4082-4b7f-08dd68957c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmFhczZpMFhJODhPSk9SQ2c5eCs3dEU3eXVVRVVxaFNXQjNOZHA1ekc4UGdV?=
 =?utf-8?B?ZWEzZGozYmlxeGZOMFJlbUxmUW5yeEpYcjBiOGFqR21rQ2lUTkJXT0dzZlMv?=
 =?utf-8?B?ck5jbUFUTGZ4ZnEwb05lSzVqRFV5OEN4UXAzbzdWcDlJeWZMRnk2cTBoMDJF?=
 =?utf-8?B?NFYwSUpFYjJabnBSTzdId0RxVis2ZWw2TE5BN1lhRlZmeWMvMFhGRFRpWEFK?=
 =?utf-8?B?SStjYklJTXJENjAySXlpL1g4bXB2WTN3RnhzaVlieWRzMjE3ZmJRcUZzWG1y?=
 =?utf-8?B?YjM0Zm5KNTNudkc5eHMrKzNIN3doOFpIcHNpL2x1VFBJSkJQd09DemNaVlNP?=
 =?utf-8?B?cDBSTG9EOWNuaDZCL2FyMGgvS1R4R1VrTURQSm56RUdwcDNueUZiTkN3VzVh?=
 =?utf-8?B?emNwMHFXdUY1Z1VwSW9TM2FNV2hoWVpYSndBYUpEQkk5WW92bHBWU0tZM2dp?=
 =?utf-8?B?Q28zdUJWbGlPZmNXbStIQnNQSmJaNVBhTlRTVDlTTTR5V243aW5weG5DYmox?=
 =?utf-8?B?U09lbEZpeThsUGJWZVhZaVFjM2l5eExUNFRQTkFvL24wOWszS3kvWWUxeFF4?=
 =?utf-8?B?eUlpVWJsckZsdFRlTWtHOE1OYk1rckFCRy9HV1lVZnpteVZsejBSNWVsTHc3?=
 =?utf-8?B?NDFFWFJpbDdCMXhKY2FVTllvNjhpZ3hPMkZaS2ZOZGxEblhUOU04TUJJemZz?=
 =?utf-8?B?dXNJTDZqelVTOERGZkxsUmNFSUJRaVB4eFZpUXdFZmVkUDhnVElzeFBCQno1?=
 =?utf-8?B?NnA2NHBNT3drOUcwcE9iTklQbnpjMXJPWW91SVVXMG56ZlZDNkROMlorOWtl?=
 =?utf-8?B?QzFKWSs2TlU2aCthbHFzOGVrdDNHQWI3bVlpSnZoeFpIK09rQTcrWHQrK0VR?=
 =?utf-8?B?ZUZFRzJpZ2prM21qaC80bXFtK2Z4ekdkc0xPSDNnRlVvRW0vUWNCRWhvRHZO?=
 =?utf-8?B?QnA2VFNGejRUNmQzVWw5MjdkbHRDMUVyNVh6VlVlZVVCYlhadVBlbTN6Uita?=
 =?utf-8?B?OXh0YWhGZzVmSWtONllscnByL0Z5WVNHY2xFcElGcDMvMDRONGxwTlI2SGl1?=
 =?utf-8?B?aFhvbUNGMXF0ZkdKclN4bzgxcURqaU1pNHVySHpILzM1TDUwUFNDMGJON2ta?=
 =?utf-8?B?TnlPZVdsSGFNZk1DWEIrQVpoeng1a1BRYkIrUzJaY082V3B2enFiU2xkNWxZ?=
 =?utf-8?B?cjFVTmphSHozeDVvem5pdDVNVUI1SVlSUGlRM1h0TFZ5RnN3Y0FjWk5DKzY3?=
 =?utf-8?B?V3U4L1lDR1Z2bXZxQTY4YWthTCthTTlESGpRT2Q5ZHNObEdKZHJhR0w2R3dV?=
 =?utf-8?B?VEFyQnphZnNJakR3V2tJVXlmK0wvNjVVR1A1MVRITDZnQWViSVpxVWZOQU8y?=
 =?utf-8?B?c3dlWkdqVEFGUDBxMTNSZWlJMXFCTWJYc1h3a0hQZUlMQU54UVZUREl6RTlY?=
 =?utf-8?B?eXR4N3dwWlo4K3V1bjFCZTRUZyt6d3ZvUG5zclgyUE1obXlva3Y5R2QzQnd2?=
 =?utf-8?B?azB4aDRHMXNQWEZnb3JOMzJDSDF6SVh2ZkphUjRacmNObHRkWUJMc1hjeXlz?=
 =?utf-8?B?ZTlnWW54dTFBOUhhaTJxaUhvQWFWU05QUTB1aHJoblJZbjUzV3JHZ1NlSTRI?=
 =?utf-8?B?cUtrUExDRVFIbGgzK3RZdUc3V094ZHlMVks4eFlIMzh6MmplSlZ6OC9aR05j?=
 =?utf-8?B?Nkw0Vndjd3VBSm44L1NkWlpnWmVuT0pHVnh2YjczMitNa0R2OE9sa0pGZmM3?=
 =?utf-8?B?ZCtuakhlWE95cTdaNk5VNDNhQ0h6amJHTnBJMGxlWHJjeFhCZ3p5SEJ1dXkx?=
 =?utf-8?B?cXZ2SHdqaVp2bnM5aGNBSzRNNzd3Qk5NRTRsU25nYWRIUVlZVVVWRkY0Z29y?=
 =?utf-8?Q?bo31L6Eo0A+1E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2RFUDFjKy9JZjRjUVVsTVNWV1E5S01QNlB3aHR4djUvZy9mMjNzNyt1T1ZJ?=
 =?utf-8?B?WkhWaGVhR1F5WWV5RmRLN0tJRFpBYVRmRE9pa3VkOG9MSjN3bE5sdG5IUE5i?=
 =?utf-8?B?dzVNSXdLaDVsUWpBZTdwTU9vamZ6REdmNXJyUGtuT09teEN4T2hveGpVZ2k3?=
 =?utf-8?B?bytEWmNiNEVXYjV0VVRxcUN5eXdhT1A1dXhXeGV4b3lTRzhkMTBGSHovdmZG?=
 =?utf-8?B?YlBxMFdWdEIrVTB4RExmZ2UvdXcvK1M0Q0dPRy9oUEQzK1RlUWdDTE04bmVO?=
 =?utf-8?B?Um8zYy9hVjdNTlEwUElvSXFSWFZCZStOZjR4UVN5TmQ0Z0hVZzYxRFlRa1I3?=
 =?utf-8?B?ZDc5MFdzZENwZkdnd0YzeUlUT1lQMlhNY20yaXViZXZyaUd5aGp6eDFVNDdm?=
 =?utf-8?B?c2N4T2FhMC9yODk4NzMxYWJ6NHlxbXFhT29KQ3ZuUU1WM2U5cW1taWZVeUFP?=
 =?utf-8?B?T3dPeUpGZDVmaTR4KzZ2Z3IzSU1tZVNHdi9SeWV6aWw0QU8vb0YzbTZaTzMz?=
 =?utf-8?B?bUhacFpNd3pQZ2VKTzYyNjRDbVlKTzQ3NDhBTTFZUzJpUTB3SEFONXN0RU9V?=
 =?utf-8?B?REhuT09yUlV4MmF0dmw2dE5uNm9jd2F3T0JYRE8wRmpWWStKbngrSmxUL1d2?=
 =?utf-8?B?T21lZGFRNnYwMjRsc3lLL2JNMVBCZnYwaE5sekRtdFJkcUliYlZqOW5iMnNw?=
 =?utf-8?B?NS84SmtsV1NtNy96TWp5dVlsZDB4N3RJYmxtV0Q1bHlTZ1NxYWh1RU83VlA0?=
 =?utf-8?B?ZllZWWRKUTVvUlFpRVIwREpWZ0dYcDdmVnA3LzZIUndpbmY1dTFFMllpR1Jh?=
 =?utf-8?B?SThJa0dqYmhJOWdiRFpqa3NNQUwwbFBYc0ZjY1dTMVZZcDJiNlF6eTlwL3hH?=
 =?utf-8?B?RVJOeG5lQVcxWlErMGtDQmZGYmpXR2FRVjJnY200YTZwOVQyZ3NUM1lDRVNM?=
 =?utf-8?B?Y2NzYUpsYSsxV01tU2ZtaGFxbkV2bmNhSlV5V0xzc09KUVhlQzE4RmM1ZzFM?=
 =?utf-8?B?MUxwTUp3YkRkMHhYR093ZGxRcTdZNGxlSEp3T2N0aDNCZEl1SmxESFBPbWk1?=
 =?utf-8?B?algwbUFqbVNPOUdJajFmTW5pa2RYSHJRSS9ZK3QyalBqYnBMd2FmTWdpZ1Jh?=
 =?utf-8?B?VksvNUpKV0lSek5zWGVmemJBakZLenBnWmRubEZxbWZuME1FdU1XS1pxMmFG?=
 =?utf-8?B?UFdxQmZCeEZQTDJtcjJvckJ3ZTZianVKQlZvbHIvTGpDRXc4QVd6alZhT0wv?=
 =?utf-8?B?ckVVY1JWMzNxa3pqMUVkRjdZdkZJR2F6MWQxUzZmY0htV3NTV2VoS0RKY3N5?=
 =?utf-8?B?SlNoL2hvdWJEM1FDOVEzV3NyTzNydHQ0M3RwMVpBSmFRZmtVWDBKYzlQRUhI?=
 =?utf-8?B?K1M0ZjZaNVBWVWFhUXNVSGU0b3FTZGhwTFVvM1R3aE1QUEYySXNXSG0xakZ2?=
 =?utf-8?B?V1BQQnhKZVpRS1RLdnVTWUlkMzYyMXlLL3dTZ0RIcDBUNHZxNzhhb3doRlJO?=
 =?utf-8?B?ZFVrLzdHL0Y5Q29KemtiMkhzUWNVdVZrZlRqQ0RUUEpFdHNEVFZZNlRJRitJ?=
 =?utf-8?B?cm9IMWFjMXRWYk1wSFdHd0hiUFhleVJZZzBWVEI1SkRyKyszMlQ2SG9VakR6?=
 =?utf-8?B?amdLczNzNUEyQmRaRFFuMVd4TktHY2d3azRRdk11NlZWaWxCdjB3aGZWVVZ4?=
 =?utf-8?B?V3ZuS1VSWUdtSjMrMlMrZVJZS0FWcmlHNDQyZlFyREkxYk4vMDJNODN3eSti?=
 =?utf-8?B?akxwTjNxdk10YXo3Q2l1VFFlMW5adGFFNHhUWkJxWmpkMnJiOU5VWkdMaVRW?=
 =?utf-8?B?TWREZnJMQlB6RlV1SjM5aTd1amtpRUMrWXlZdUd4RElOUnQxMkx4a0g2MGNB?=
 =?utf-8?B?NkwwelNtVk9WU2J2eFZhWjlDTTJUNklHQTg0cEQxSGJneFNQd21hN0xqVkU3?=
 =?utf-8?B?SE0vUjNsOFBkMGM4S2cyZEtWenhFZVhtN3IvVHZKN0RQRmdBUklReGw2R3ZV?=
 =?utf-8?B?ZngyNFZVMVdWQ1k5UGpoeFNOSTVsR05ydXc4UU1GR0tGMUdITXJaSGJROWFj?=
 =?utf-8?B?ZWJLT3lmbkEzQityZ3dYTm1QR1FZRlBSYkV0cm1qVG9WUUFqY01PNGpsU2M5?=
 =?utf-8?B?enQzc0VHTklycUMvZHEzWmhnNVhqazN5ejhFSFhGV1dhWk96cHByM2U2aFE5?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 70042e95-04d3-4082-4b7f-08dd68957c96
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:29:00.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHm9t7Q3rzfALvHQsT8O6QzANKd7f4mmePkkL63gOzycK6viKkpgw32rT7sNlRcFHj2FhBdDCWsmiXAUSoBgss+wwop0WhnZZTZzLswQCFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 16:29:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6602



On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
> When building for nativesdk recipes, HOST_CC_ARCH equals SDK_CC_ARCH,
> not BUILDSDK_CC_ARCH which doesn't exist.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

