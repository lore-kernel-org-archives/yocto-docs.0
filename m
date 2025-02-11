Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E78C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 10:52:29 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.64])
 by mx.groups.io with SMTP id smtpd.web10.9476.1739271141658982061
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 02:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RJdO9qWM;
 spf=pass (domain: cherry.de, ip: 40.107.247.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1YlCT4r+eOq1d5NF4OkZtIdUWf1oEHOTsaR2r2lFQ15c9WugMm1AbiIqL1VDHHkrtRxdGmxE6a3eYIGP8RtSW8KFpCrJ8m3ocCMs9BFuuOebv/foy1iRM2GWvOItfF7j7lLtVk7FrsAfv8RQypVfKpZpWuvOGWoUFdQFrWGXJuP6Oa3cMQJThA+H/pBzqs2UJhGOermBDkvrHeiywApvEZok2dW84TZPS3pNr6GDSaYCpXWmvqu3q2tSlSVvnnuabfiu0HfI5wQWXnGLICtekDoqi2ua5FGM7CbmqbvwA7PlraYK+GEI+Pf+QZqwsFMvYLUfRyZ5khKta03s25fNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FKJSQmhChpUqci4Jos93S0pMq6OHGhVBqn2We7U3rs=;
 b=lx0T8Rl221AKyKre18ZiznZxI2l1d+ohkCLDbwP5KXlty8uQuzI1sKCduYnHjBdl6wfiXwa/nkTmDF5u/UEam7cxNF11BsAlrPc8UxYxszoIa9wlZBd0jnZRZi+nuy40hv3F/77MbSL2D+IxyverDx0k1Fj/aL97A/aOGe28iz1oBMi39lb/MFJKW2gd+CjHtdUpMRJ91az+kvxYdhCz8u/a43jBvD5YULvB8UdysijHy2josHhxx7qYJ4JQXxPrRuu+8lk/PyM0JaxmFdX992bQ0H4UjURiYPlURVW/1S2ET8rYS3/BrVzbC9bH5jDOLnoWH4I3kbJO3f86BqsxSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FKJSQmhChpUqci4Jos93S0pMq6OHGhVBqn2We7U3rs=;
 b=RJdO9qWMUjQiPq0//981EM6R8JiWRYE41G+/YuaGbjam52Y38ZhikxL0XAZjvqbUWFC8I8y55/avOyp98b9s6MJuLhZz6c1IjZxmionPZ/v2Mrz+IQ2mjQe+fHv8tsI8cRdbZNDnH7kJrQg9tUVkgbyqjubn4i2zxRlLuikGh/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7444.eurprd04.prod.outlook.com (2603:10a6:20b:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 10:52:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 10:52:16 +0000
Message-ID: <c5e857a3-9801-47ba-9b36-cb799427a03f@cherry.de>
Date: Tue, 11 Feb 2025 11:52:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/6] variables.rst: add a reference to
 BB_CURRENT_MC from bbdocs
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-2-f63cdab1fad9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-multiconfig-doc-v1-2-f63cdab1fad9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7ee3df-815d-4d80-f294-08dd4a8a2601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WEpyNGgzdm5ha0syR2hBNTlwczVaeFJJM3h6Q040SHBMYm9LK2NGYWV6TTFC?=
 =?utf-8?B?TzZLMVluM0ZZVVNDQnBuRzU0QWwyelFqUmxwQ0tpcnVsL2NLV2FJZ0VNRVlO?=
 =?utf-8?B?cVBURnRjVGFYR1VGU2E3Z1lMaTBQS0wyUURLeUxpN1VEcUJkb3N4UFNSR2tY?=
 =?utf-8?B?OXpwK0doSWQ3cVIxdW9zMUNBbGp5c0xoSktzamMyVkF6WklmL0FjUFJtSVJy?=
 =?utf-8?B?S1h5enRvdnV6WEk2eDlqdWZGUGk1aTlobGZBYmdhZXhtNFNyeWJmV1lOSXA5?=
 =?utf-8?B?Sml3OVh4QURIbWNBdFVpMUdDek9SK0dxT1NTY25yaWNMQTRYdWl1YlNVMXhI?=
 =?utf-8?B?TnBta2thcjgxSTc2N3JWVjBjcXZxR05aYk5QNEg4N0lvaHRNZjZtMnpBdUxh?=
 =?utf-8?B?SFNKcUcwRGZGcjJFQkwzVkhEcEhNbDRIVTVtdUE5S0J2N1JsQkJ4WC9GNFRC?=
 =?utf-8?B?SThnNjdreHhvcmNFdEFWN3Rsc0dpd1hhRnpWNkgrbndVc05rMVd3MUZTejFw?=
 =?utf-8?B?TkNZUVZ3ZzgweGlOWk0zY0x5bWdnUHFGT3pWeUsxRk9WOThSN0oyb0ZMM1hQ?=
 =?utf-8?B?M25DOW1nNS9HaVpaK05EMVV4OU9xUTI5UWtMcnM2bXp0MkowUFNBZ0V6RWh6?=
 =?utf-8?B?UlpQaHZYWWdmR1lsSHA3Q25aVWorZ2RqNTdreWJGeVFGb3BPc0Z6dVJOeUFV?=
 =?utf-8?B?VitQeS9xblp2dWlnTlcvK0g3K2lCY1FMMFBINldPVXp2czFCNFJscmpTQTRE?=
 =?utf-8?B?eHpMZGZsUmdyL0diNXdNazFBK3RlUnRQVHRuRC9mZmR4RVFUd25LTXNyWFo4?=
 =?utf-8?B?bnFzSFVRUnc1UllreURYWFNPc28zMHdSdkpGS09kR2FOZnMzS0J4bTBsbXd3?=
 =?utf-8?B?eUp6VXA2R05iOVdXazVTK3J5dEJ6U2Fkb3dBUkx6SE4wL1hYT3o3ZG5rWkd0?=
 =?utf-8?B?Ri9BNzJuVXh4TEwydVkwZlgwS1pIS3RVL1BnaGNncUZSelR3VXdXRFZNUWlo?=
 =?utf-8?B?RGVOczBzd0hqZldKU1Azam1yVU8xN0NJZ2djZEdRdlBjeHhJM0VTbVl3dVc5?=
 =?utf-8?B?SXVkc0owcVAvMVBvRDdCdHZ5eXlwdTVrTC9mUGQ4OVZ3VmNjY1l2WkYxVHVl?=
 =?utf-8?B?d2svckVpdE1GMkpYSW5BNFlRMlRHOU1YekREZlVVWW1iajFZTzM1YlVScUpF?=
 =?utf-8?B?b1ZBUmlpeG1mVnhnLzJ3Yk1aNjZOVFlCdWhWQVIrRzFzcVErL1RkRGg1MnVC?=
 =?utf-8?B?T3VLM1JFSmxaVmpmTk5WZHB3OEZOVnlEWktGSWxqTWdCRjVVZ3RmVmhUYzlW?=
 =?utf-8?B?L3VNYU9BSm1JVFU2TnFTRVRyTkVmTkxVSVNtVVpRNFFRa0FLT3hzSjUvM05V?=
 =?utf-8?B?bWtlV290UGdINkNodTBnTWQwUGVEZ3hsSkk4ZFdWM0gxbGtCRjhDRW0ra1po?=
 =?utf-8?B?cjBmWm5JNmFsQVA3YnV5THdsZmFWSDdPcFc0bTlITHBMaXpwa3FXOENNVWtB?=
 =?utf-8?B?Wm1XR3FVbGtISC9vMEcyZm1DRFVSTENIRUZRaE5YSnZMRnlyZ0dURFljb2VF?=
 =?utf-8?B?MGEzMjlvaXN2VnZ2Q0UyU3pHMHFRMFJtMWF6RzIycC82eEVvVDJKZERCTHV5?=
 =?utf-8?B?NDQ2cDdWNHBORm5MaTcrcktjeUdBQVVlWlVkeXJOTytUaGdxWnVMQWRuc1hj?=
 =?utf-8?B?WXQ4VWRldTNqQmROM3ZoUjAzWW5jdjdqZTF4cWZLb1BjYldDMlF4U3BQNHRV?=
 =?utf-8?B?cDZBUUxreGNobUZlSkgxZm51djVCdFlET1Z6VSt3K3RVcmkvREkzbHlDWWE3?=
 =?utf-8?B?UEcvSDBWd0hWMnFBVjdIS1YyN3RZL1pKdHBDd1NURXI5eVRlcjNiZW56TUxq?=
 =?utf-8?Q?QJyY5AoUwbcr0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUFMelVQR01qUm93a0J3TUtvelpIVG00ZEZlVlNjOTdwZTE0eGZINzR3U3dz?=
 =?utf-8?B?N2xTTmp1ejBScUlKMStrc0FzbEYxeHg0V0F1U1o2Y0NUM0lOT3d4SEFmbGxm?=
 =?utf-8?B?Nm9xcTltUUdSaitKSXIxUmRzeElhUVBFTmpiZnZnOUZoN25rQzczRzlaZ2d4?=
 =?utf-8?B?OStZVTdZTGVseThwSm5SdGExYjl4SjBCRWJTL2x3QVd6K2tUaVcxbmpoaDlO?=
 =?utf-8?B?VldScWFYSi9yM3dNUFdpVXlJbFlFVk02eFcwcmdOL2xHRDJ2MkFuSzdSc05U?=
 =?utf-8?B?S0Fnb2JqdnF2R3FCK1o4RU9xS1JpNXdhOU9UeWdUUEtDSTdQZHVBR3JIKzNk?=
 =?utf-8?B?TW0xNXlTSHR1aFVpeVhpZWlLNCtOajQ5cllseEpqRGdBeklwU2p4UUZndmps?=
 =?utf-8?B?Z01JUjRYbzZxVGxNbDJmckQyVEQrQ3dEQnhWSlBQMVdaY2ptR0puK2J0ZjlJ?=
 =?utf-8?B?d3pEMnpBM09rOGJxQmtkWDVHbVo0ZEphM3YweUQwamt5NmVDYVNqMzd0YTdN?=
 =?utf-8?B?MzVkKytRYlBaVy8rZEZ6M0tiWGk4VnpQUjJyL28vMWtncGVrOTNrNjBad3Bu?=
 =?utf-8?B?ZWVGdUc1aGQ1bTNNYkdWNld6c0FEYTZzaEJMelhPcUVmTU4xZ1BCT0xyTjl2?=
 =?utf-8?B?WXlzalNXeFNPRlBqMmgxTWV6bWtEWksxR2t5Y2t2S1RmdGxGUXVLQmtYNWEx?=
 =?utf-8?B?Y2g5d1NYR2FxZGJsR29KY1A2a094eW1hQTNMMVpFUHh2cFpaaTVIM0JLejl3?=
 =?utf-8?B?eUtEeTVrWmQvTjNpVWhtSzIxaUpUeUpVWngzKzJZcFRaVkRHejdUUVkxUFlF?=
 =?utf-8?B?bEZBOFRUVHExU0dyT2l1aTJkT1VUaDNoVlFCbEIvemE2TEhWZWJTMW5MWU00?=
 =?utf-8?B?Zk9GZWVTMGFRMmlqaWtUY0ZpWHpHUnlVWTYyWU41TkRhL0xhS2hmQWdVTXhw?=
 =?utf-8?B?M3VzVy95cDI3RGY5UXFUSmExbmZ2M09BRnZvbGlEeklTZWNLMWU5MnhHaFY2?=
 =?utf-8?B?dTMrVmpXNDBwQkRUeVVMS25ma0J2Y0I2NTkwVDdXYkdndXZlNklVWXZzSVYv?=
 =?utf-8?B?Yk9ab0F6cVRSNE9vaDlLTmZLVGVYZm02Y1dQWXBoK3pPL2V4MFdaR2xMUjVF?=
 =?utf-8?B?R25KRmp0bkRkSVlWd1g5SVlyOXB4T05nbW5GcXRyekFMWTUyV0t2Mmo2MHl3?=
 =?utf-8?B?KzRTaDJBVFBCVnp2UTVyNmtDdGZlZUE2VytVV1grRXdWN1BtZ25XTlVwMDhR?=
 =?utf-8?B?a0xsWUg3WVBZSUtuOHZSY3ExclFQSGZoaUhHdG9lVEpySWNBNUxDRU5aL3J2?=
 =?utf-8?B?TW9DaWxwR0ZyTE53bXpZdncxY09SV0M4a1lmRGg2eHEwK2dSMXMwZGdTeEZr?=
 =?utf-8?B?elZVUFU0ekFXMkVKQnRyTUVtOXlWanhXcDNwdE1lc0FVd1BFM3RVQm9DRkNR?=
 =?utf-8?B?a2JUV0FRcDdCNFpUd3hLYUxwSzg4RmMxVlE3ZDViaVNPVnNSQVpCQjY0c1Ji?=
 =?utf-8?B?azNGN2c0alZqcytCKzVoM2txY3ZjaU5oVGM4RmJSQks5M012Ykh2VkhuT2Fv?=
 =?utf-8?B?MTJKOWJsb0Q0eWNTYW15T0RaWlpJTU1iaEdKZHh1TnF4cVJsbXROeEdhUFZN?=
 =?utf-8?B?R2RMdVBicFhMbXJPY3pReGNVWjEwSDV2YjBDbndsUWsrVnFCbkp5b0xzdGVE?=
 =?utf-8?B?OGVCcHp5YWpNd2xuVnZRYVlYVWthSGxwK1gvT0FoY1lyZkRRVzVac2hSd2J0?=
 =?utf-8?B?YlRyelN4eUFSN2FhVUVqZ0IvaUlQNTBadUVwdUhuamJmV0JCUDgwYzFVemZk?=
 =?utf-8?B?MDFsdFI4a01lOVVwSkF5aFVDTnpXQnkrdXVRQnhtb3BRVm9CSU5wVWNvK0la?=
 =?utf-8?B?N0lzdDUrMjFIaEhZZEt0eHFGQzhlemJpUUxFbnh5VE5HMWtseFR0TUcyNWFU?=
 =?utf-8?B?YjhDcEs4R1ZOQVZYRzdqWndvTnp6UmJMMDJRd3N6dDRVczBpWXo5UjRtNmpF?=
 =?utf-8?B?QTRqOG55cUhrbDJUQjJSaFFkR0NvRzdxTTA4V2t2NERoZ0FERTVveXRtaUlv?=
 =?utf-8?B?UDJqV0wwbStveWRNbEcvUXlXQ0ZJTVVGWlB6TmtmVWZMdnY0bHA2cU94Nlhp?=
 =?utf-8?B?WktVOUZ4di8wcVBGblZQMFVGbVpQNThVTUpDOGlpRitMUERBYmlWS2NCTjNP?=
 =?utf-8?Q?+rq4/zzXEdr1mlrXZ3v9P/Y=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7ee3df-815d-4d80-f294-08dd4a8a2601
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:52:16.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPbFyMoKpG/yJTJ3jrcu4lDKsi2cNzeNb2Z2rqfE9sAWzLoGaxfPTDjCg/MwNTBjDM2bWbOvsU2nI6r+u0a+vkLEFdLzJCDSZ5vVXFaKVAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7444
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 10:52:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6329

Hi Antonin,

On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
> BB_CURRENT_MC is documented in the Bitbake user manual. Add a reference
> to it here.
> 

Not merged in master yet though? Did you forget to add a dependency on 
another patch series in the cover letter maybe?

Cheers,
Quentin

