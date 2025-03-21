Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6CFC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 16:25:51 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.web11.4219.1742574340831331111
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 09:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hDQYsdqC;
 spf=pass (domain: cherry.de, ip: 40.107.162.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j66j7RXf2vaLd8YPiO2qYoiZ41rJQWEztzgZTb9PCgt4RXBaT+CCszRHcsjr98nLghAhLnbXtuQ23lh3++JaAbw9Nn3uvulnc5AwecO567/am0X5P0LGh4sXjE3GGZ8/5Ona90al/04Rr9CmdmZ1ORBB95tgQJo76dbfKGW30HyEu+rtsSVyPx50W0ixS6nhwTNvSzY+/PY3q5kbu0N6AmUneKmv8Y3Z2dcWazDFIAwXecjowsHyD5BpavF/x/mvDgSfijVEBy31QrkDit9VWiiEAopBkRUxDZi7TprAhKfvMzd82uu/bwccGm558x32QA69vjyswIBYeja28SyBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63hLXvL1CMT9oECwhcTdpqLsGMD7rWmwp9NxEbh34to=;
 b=x4Y2MRrC79W/GkKxXaXsfVc9aFiqA/Oi7sIJnfuPwkSbPTclmKKn8nmcFmCxt0UuAoJmrSpKWfIt0qfLiyaCV1GuNXwKDhT3+1OBdd6ySr2dKIgWHBLKVNLrFL884bv9rV+A/+Z9hHV/yXMzYw3rc9iTYVgrOC7k2CKjKmLJpXEiBWVorl5OhpvlB7Bm0siQCDCXR7STXKwdmg0DDdrRI7zsiax+fIxkYCwutxye9fUdP6bxCOGxi4UqIrcVIJplEZGJK2R4K9Rm8cxZ7cC+UHNDXATN0CdAt4hGg+tBEaVRcySF4d3wUFaAz9dPwOnMjnad/hJlVzmPKSch3kpcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63hLXvL1CMT9oECwhcTdpqLsGMD7rWmwp9NxEbh34to=;
 b=hDQYsdqCYArh+2PjRr8/YeUo2kaEMusLwDZxCt2LRc4WvT5M83GBhJNOh8Ouq8lynWovPxqOoBbWTZS4NJBsOcQOOtqRM3cbVB/9fUq98BJzsdlFmL9X6SQMXOsbvH1VOypsiavjlVvJ022M9J+ekEeBgjICALDFveQftiW4hTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 16:25:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:25:36 +0000
Message-ID: <b871594e-dcd9-45a9-a004-b289fba99eb2@cherry.de>
Date: Fri, 21 Mar 2025 17:25:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/4] ref-manual/variables.rst: document HOST_*_ARCH
 variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-3-25edbadfd054@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317-cc-vars-v1-3-25edbadfd054@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e8593e-c661-4d00-e47c-08dd689502d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3JSc0NmaG1rZEpBZi9vV3U0UldWSTh1c08zeU5mM1Zpd21yVzg2ZHUvUXZG?=
 =?utf-8?B?cjd1T2pFeEk4VDUxRnFhc2R3R1RTQVcrMU40aS9ZcitNZ1pMMkt3TjQrejlV?=
 =?utf-8?B?Nmt5SzdRTG5NNXBXdXdrN2IwQ3VLZjFScVNCUldPZFZZRXpWK0dUY014eXRM?=
 =?utf-8?B?SWlvTzMrcGRFVGFWQVF2TlBuWXNvb0gwRjE3amlWWGdOc2ttc00rY3MrL0l0?=
 =?utf-8?B?ek12YWdRdVA3c1Z4TEtJSVRrSVlWc3poeEtsSlVjMEtWdlBkR2tLaDJQamFP?=
 =?utf-8?B?SjNYRHdvckR6dmFaVkNFK3hwQXRGVVZmdTlWcVRpKzA3SVFCUXhyZUdQR01S?=
 =?utf-8?B?Qm91cnRRTW1DZlJFMmY0SzNkbGgrMTVoa3Z4alpJUnZsY1pYWVVFTThSaW45?=
 =?utf-8?B?cWZFT01RaVJvbkwzMmhSVWFjamkyajJvYzhseURwUkpVbnM0dVR4NXV1Mmw1?=
 =?utf-8?B?bFNvb2JQTmYrYVNJSlNmQjZra1ZZRzhCZTRUR1FVSUJJTkRnMmV1dndIWEJO?=
 =?utf-8?B?OGxIOVA0WXE0dm5lVkdjT3ovNEdZbTk5NGtESytMaWpyTStwZHV4TThDa3N4?=
 =?utf-8?B?c2dOaHlyMktveWkrazltdS85d0JRU3NpQnlaUkVQZ3p2cUk0UDI0YXRCazIz?=
 =?utf-8?B?WE9ZeEhEVWhWeU1VR0pNUHo4b0lDSFVFYkNNUTZjSzVGaUpib29LRFBCQzJ0?=
 =?utf-8?B?ak1WbXRSOXlzOExEWURSN3hkeUYzaUlRYUVLUmt5b01JMnJmTGNJMGNuSlBm?=
 =?utf-8?B?cnB4NHhxMnZxRTZ3UXo4Y25OUWNabU1NalJhWUhSOGJzZ0llWmsrM21LSHBo?=
 =?utf-8?B?ZlZGeVFEQ2FSM0FtOWNseUtjT3FWdC9tSVMzMXF5RGk1OTNHZ0dYVkdHajhP?=
 =?utf-8?B?QjIzWElCYk8zeVdHYmR0bmZ6dlhwTGphcjdkN2tnV0hZdDgyOU9sZm5EcXFQ?=
 =?utf-8?B?aGx3M3dnWm56SXRwaDI4M0hKd0tNaitQdnZUQnpzVW1OMkowNzVqVGU4Q1o3?=
 =?utf-8?B?Y2FUeWxQWjU0TUZVaGJDS2pCQmRsS0JmSTdZK3FxTE55MGhhdUFUd3ZmdFdB?=
 =?utf-8?B?MkdkRmtBS0tISVZxd3FTN1dYbk93cUx0eFF1dWVqYW04RlRva3VJbkxGS3B3?=
 =?utf-8?B?WUdQSWdBdFVvRGo5U28yODBNbkZFajk0N2Vxb254T0NUK013RU9YVFRaYWZL?=
 =?utf-8?B?cDhLZUVKcUdKY2p0TVBGeUcxV1JmRnNJMVVTQTY2OExUNHVQM3VEbFJJaEg4?=
 =?utf-8?B?YXZJZFI3R1ArdCthR20yaTBQNS8xMEtma0NTWll0REtGbjhnSC91U1NvcGtI?=
 =?utf-8?B?TWF6MXlsSS9ZcHFrY0JGYUlLUjJoR1hPMVZlemQyZ2xRcEZ0QzJnUSsvblJv?=
 =?utf-8?B?TWhvdkNML0NlUGN2Vy9iczEzTjRFdEExK1NkOG5mOCt4S0xEak1kckFObVls?=
 =?utf-8?B?V05TRnlwd2MwQ2xIUEFuOTRiSlI4ZnlwUjZsVXhyL0J4Z1hwNTNIQUh2anJO?=
 =?utf-8?B?UWMyYzl6cElrTC9oUFBsVHZ1dE45VzBWQi9MT2FCc29zQnQwVzM2T29mbjFD?=
 =?utf-8?B?YkE4U0NObFZBSVhGYlB2MTZLcHdpOHh5Sm16aDErVE9jWXNZdlJDMGZScWJ2?=
 =?utf-8?B?b1p4TEFrZTNuK0JuMjZBQVJoMnNJRVprOGtPalFhd0ZIcVIyaDdwNkdneEtq?=
 =?utf-8?B?Y2MxUEkyejdUdHNRdnNMV0tJc1YrVUZkL3NmNjRiRlZFRWp0Z3pKYWthODhi?=
 =?utf-8?B?RjQrZ3BHRjFibExSS2NSTTVYdUVBczExYk9pbjM4MWMwVVhsdHFKNzZDVVNX?=
 =?utf-8?B?V2VPeWh6ZUdWbWs1OHF6bTBnejRYdFFyNG5iNHdUenFZTDlXZldyNVNGVThW?=
 =?utf-8?Q?R2qn/M4+X/f2l?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVJVMDlneHh3L2s0M0JmUTJ6cDFCaExlTEE3eVhHaHpleE1lTnFPejlhZWMv?=
 =?utf-8?B?NHd1Zmo1YUN2QVdZU3ZXTTZzQjRFd3Q2SzVYVzNjNVEvaEtVNHFLWFRUZ2NK?=
 =?utf-8?B?Szg0dktCR3preTNBR0pQV2krT2dLMmN6bkdna3dCQk1HeTdWYUFGZDVBMmc0?=
 =?utf-8?B?UDFrZlpuOTlqeVRJUXRaTGs3eEJaekpNZ21KVlBCYXB3S3A0VFg4WHExT3dI?=
 =?utf-8?B?SHEzQVdLMWQ4enRWQ1dKMnAzRFZxeWw2VTduOEQ3U0dQSkJ4eUE2Zmg2NlhN?=
 =?utf-8?B?UlhJL0VDZEEwWEhzWnplRS80VDgvYzA2MjlmMFdWRStWWGZtaHBhbmxldmtF?=
 =?utf-8?B?Y1ZBYy84NjRzVUtkYVFIaVF0VWZCcGlhTDdXS0hKbDZqVG43bjFacVc2eEVP?=
 =?utf-8?B?bUdtN0Z0bENUWXhCWENMTzJCS0Iwdmdpd3JxNXg0Y1RBMHk0VGRDVW9yZXRi?=
 =?utf-8?B?UG5keXk5VXZJRGVvMFJ1STU3bitIcU1xRDVmdm9HWnM1a3J1b1hlZFRkZDZn?=
 =?utf-8?B?VERVUmt3V0g3aVBzd2ozRWRGVUgwWk5zOHpqRUJRNTR4Ykk1RGpJN280dzlZ?=
 =?utf-8?B?WThLNlEzUW0vR0xaamovOWZPcXQvTHE2WUZsaWtUSURrSEtzaDVKd3FLQXBp?=
 =?utf-8?B?RXhuT2I2a2dUUTBIc0wrV1hDMDVuZEhBMzRLcE5paEFUSzYvNU5sYm9nWEhl?=
 =?utf-8?B?K0dJYjgzWTl5dnBTbFJ6Y2E4c3RJYlYraVpvSzlNRFg2WFcwanVWaGwvaTQ3?=
 =?utf-8?B?Ni9vOVFSYVpBOUhrSFpTZnFMSEtubkpLRVp0eEc0c1RpRzZGaW9QUm50cW1x?=
 =?utf-8?B?OHJweURnRHZwTDlwSlBlNjh3d3Y2RENROFZYMGJzckx3ZjA2emhFMEtEZUdJ?=
 =?utf-8?B?VjV2Vlc4TGVZcU55SDF4UkI4cUNlY0twd1g2WGxyTy80OHVpK2czRG1Kc3pY?=
 =?utf-8?B?R2lsWExrU1pUZ1ZTZjluZ1hmZTBTblJzY2h6Y3RFQ2tVc1VQUjZuRFdReEo1?=
 =?utf-8?B?d0MxRnU1M05FR25hWGhDa1dEeXdYKzZwMkM2VjJYNXZ6ZHJrc04wRGljSjVX?=
 =?utf-8?B?Zlc4S3hrZ0RvTmdYV09OK0VsaWJ4c204V2NLd0d3VTZDQ2gyRWZHdHhLYXVn?=
 =?utf-8?B?bDJhQW81NFltUHZWTUxWSHZPRmplSUZ0M1MxQVFLZ3RTQVZWcjdRRmtMSkNi?=
 =?utf-8?B?QWpMcU5sWkM0MmJWSFRwbmVFZVR5eTBZUnVtRUF3REZyMnVOYTRqN2Y3Tm5U?=
 =?utf-8?B?VmtDVm9YZVpLWGlsbkduaFhxOS9KV2M5OFBjRHR0WjN1bkp4TjA2dzQvWUp3?=
 =?utf-8?B?WmRuM2o2ZVo1a2s1V2xTT0ViWFhCSndZNkc5dDFVNlBjYTlPUGRVRU9SUGh5?=
 =?utf-8?B?TjhuZ00wOUNtbXBUanBNR1lJeGw2K2hwamtESFkxSGk2eUgwR0xFMDNkaFJZ?=
 =?utf-8?B?STFQcGdjaVFZWTIwY0NTWEhLenN4bDV3RUFiQy9MYk9BNUUxZHJ3MVl2aHQ1?=
 =?utf-8?B?Um4xTmorTmdlTUUzWGQ3MjBZV2ZpM3ZEUjdGWEVqWlI5SGZjSUdsVk80Wmdh?=
 =?utf-8?B?aGp4OXhQVXZpcFlsK2RGcktBL3ExVDV0K2tOWDc3bEx0T3NDQzlQRlJzbHBQ?=
 =?utf-8?B?SnhISG5IdUtSekJjcWxBeDRCS1A1SU1SbU1GTmt0NGpTWmg2bG9XS2thWFhq?=
 =?utf-8?B?RW5jZGdtcnFzbjVsUlV3M21UR2JmN2ZNS3ZQUzFCelROKzBHTzJ6S2JqaUZ3?=
 =?utf-8?B?RkdhZmJISERCdXZ1Rzk1Y2Y0TDNrblJCNlY4dGt1QVA2Uk9UeVRrTmZRSDNZ?=
 =?utf-8?B?c0U5cm1xZHBTS2ZnYy90ek11RENlQ3FLR2FtWGhDdHFTZjlGRkxVaVl4Y0VW?=
 =?utf-8?B?djJTRWlQdVhGcUhLM3JXbTNKckpZa3BZdTZ0Q1Y1SUlYS2VJWjMvWE4wRnZk?=
 =?utf-8?B?R2NRRXhZNXhkVjIxZGJQa0J5azkzazRZWlRuT21ucmRhazg3dXNIQ0k2V2k2?=
 =?utf-8?B?bnJSVnRyVHNvT0g1eTlpUzI1WlF6TElRL2VaZ3lFOHF1Y3dpUzVDeTd6eFBE?=
 =?utf-8?B?a05NQmZNRzdsYnZXY2ZlaGpqSkNJL0RxdlRMaGhyYXQ1YVlueWlmbWx2VXJI?=
 =?utf-8?B?aGwwWE9OOE50elNRTklGcmpCM0lneW50YnJPbEQyKzVjOTZOSDQ1YTBORE9N?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e8593e-c661-4d00-e47c-08dd689502d1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:25:36.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIRf0UGWcp8WlkdWdmHoMvP2YMRqs9N0Vjk8tpgS5Aqt/CRgg7yirKC5d8aqWFW/py9Q3Nr0eFU/2L1GDGgJkinPHuAlgQ3wFllRZ++Bseo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 16:25:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6601

Hi Antonin,

On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
> These variables control the flags for the assembler, compiler and
> linker, but depend on the context.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

