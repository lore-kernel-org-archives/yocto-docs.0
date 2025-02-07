Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B05C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:48:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.9])
 by mx.groups.io with SMTP id smtpd.web10.64984.1738918121909994135
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=g3+39zdw;
 spf=pass (domain: cherry.de, ip: 52.101.70.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlCxT58FoTTmLwl/uwQi1V/MJv9U3mZvXIrIz1ci/udJkUod5vhlfNkmsG7dTO/Tju+/6YlCoIQ6658idtioqbJXaHRdKG5Xu6IQqItja+1taHqf+9ZQ0qIxYp5PxM08gc8AzYSGzz2ZDYnxdBgrtv17PUKT0DT1+gl9T5ZL7mpqjbvc95j/6a+gR7C6hPe/yF6d1466UckyCE3qq4m//pVkiyd0FvwFEhY8Sm4cR3rkWp1gKNAXN5GCxsKANvb+raGZ6xFWB2buUc+Seuooy3F4kecVVNbhEffA92q8ay/8QB7gTUOsBu/sqdwYEcyprGA3m8hfr3QfA4KrNmEZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0AKPSylLBBVvBxqhvi/BLeNlCBgCgNeffAHgtJStvs=;
 b=yknvE6LJOqEfZ9nPhO7EowcAVahERYSdZiZgO+wFr5QA38EOEBMdE3aEIG0MPaxUL0D/sOOfiGuNPfFo8zTJymTrB4nmPV8FvXMGQ1u18ZJqV5I6gyJmFT9Ee2Wck7ATuUquDgMX7k3hivYf9H7hB1JtTG46KrocJ6FXjl6K9vIp3sPiv2/IVT7qYY7nF6ty1ckTeu53+8Fvrl+3BfSjXJ3bhmbbhgVU+vwx/qBQuYw4mw9C7jEjhrVIudyhCjkd/V30JYHyc76+tcW1vBegLYCZ8IKdAL79K2Gm0AH+7apzYzXkg/SEadQYKQ3EsHQjBpYb/2wXKd9DbeOZwFK7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0AKPSylLBBVvBxqhvi/BLeNlCBgCgNeffAHgtJStvs=;
 b=g3+39zdwpzJX0gXa/A47QjfQ6wonI0T15fk/yqAEi4A+k4a8JT2UrTlJMG50I0kHcLTgaTFAj6B4i9tcRTlXyWUdpwnKcHM0GgBu04mymZ+kP4cNEpghsAYcjg+wuicNljQc836abkiHQVfVlJ5hjvehFv0bVQY+bbEl+LeT8cM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9354.eurprd04.prod.outlook.com (2603:10a6:10:36c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 08:48:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 08:48:38 +0000
Message-ID: <13409a47-542e-4cad-a973-a0cb7ebd7c88@cherry.de>
Date: Fri, 7 Feb 2025 09:48:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] migration-5.2: document BB_CURRENT_MC default
 value change
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
 <20250207-migration-5-2-updates-v3-1-9571efbb1cd0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-migration-5-2-updates-v3-1-9571efbb1cd0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::41) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 73da289e-7ed2-4c5e-25f4-08dd47543717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eGJvRERZYkNZSWtqOUhBcFZRRCtLdGp5SXpiZDRXTmVxeEx3eWhJdy81TFo1?=
 =?utf-8?B?ZzJBR3RqajUxVSt1M25zOForUSt3aUNGZkVXOU1Ud2dHQW9rS3U0QWNQOWcz?=
 =?utf-8?B?c09VN2c2VGpWL1JicHE3SytqMHlDYlJNeXQxKy95NEIxSjVxa0ZLQVpDanM3?=
 =?utf-8?B?N082aTZ5cGgzTXZhcHBwOEhlTWVsZTUxN3VUM2xic0VSREUzTkpNclovNUJS?=
 =?utf-8?B?VnJack5adU8xcXN1VDZTWDcydlpQZTFBQTlNS1ExcjRJOXcvSjZZZWppWG9i?=
 =?utf-8?B?M1lnekpLUVVXQlpwTXJycU9YWVlmNmQ2elRUVlpyWmxCNG9zbzJNMmwrUTFK?=
 =?utf-8?B?b2dPK1JDRWthUkRRNVlwUEJLSEc4ekJROUZxR3VWa21NQWtYY1VzTmxSZE10?=
 =?utf-8?B?MmV0MDhHUlorZ245M05kUUxHSGpzR1Fabi8yVEJwZ3E4bnBEU25NTytBM1VG?=
 =?utf-8?B?c2xseWoyNnJnNGxiTHc1d3JXVHlHeVlnQ2lqYjZ4bWpOaVR2emhnUE0yOFpN?=
 =?utf-8?B?Vmpid1F0RlVCTlVjNHpSd2d3a01hWDRGd3AwWFR6WUhveUZqdWV5a2dGSmh6?=
 =?utf-8?B?UkR4ZjA2ek9VblRSNVRpUDdnUHB0MmxSTTRHbEpjSUx4N1pBOXRSUnlVM3Zo?=
 =?utf-8?B?MHJqMlZyTHhYS1hodmFaelB6SDBYRkdmZ3lTZHZUa1BOdjBXM21hK3lBbTJB?=
 =?utf-8?B?blgzbDA1QTBJcEJ2TFk4WFF2cERGOWdaamdvU0FSRWFoVnd4eW9UZi9sM255?=
 =?utf-8?B?d0lkT3crRWRVTE1ac0ZTaFk1Q0pqT1laeFlsTVRZRmNDUEJvWnc4eUhmdFZN?=
 =?utf-8?B?MjRkVDQrd2NZNlNzRTdndkt2dVNicEpLTnFFSXJHMDA0K0kvb3ZxTHdqS20r?=
 =?utf-8?B?d2ZWRlh0TVpGeVZtUzJZZEhxWThLV01VSzE2d3FWUU45WUVIZEswcTVUamN4?=
 =?utf-8?B?cVhWdldhWW1wTjRtdWtHTkdUVCtMUmo3OTZvbVNTdkFBbFNSeFdzY0lnWnpZ?=
 =?utf-8?B?UmhKWCtIK2Y3SHNmNEF4RGdScEluTHo1UG1PZmxoNVFKdThtR2duTVhnZXVi?=
 =?utf-8?B?dUZpOEgvNUV3VHhOcjlMQVVvSmQ1YXZCZk9GcHZFNnFMRmwyNVRxNVdoT1Z6?=
 =?utf-8?B?a2FpY1dtK0hWdi80Q3R3MFE1WkNnb1hUZy83ZTBUaytac3J1YnhYdDZNUW1C?=
 =?utf-8?B?V0NrRHZHUkFCZlF5L3RDVlB1bTAyVXAybFV2MGJwL29TVGZJOGl4SHZrbjBE?=
 =?utf-8?B?MnFVVEdoeTdFYTdJWktZaXNaTm1COHZOMGd1K2RobFpOZ2NLWlQ3T1M3eVFi?=
 =?utf-8?B?ai91c0VMQjdWMW9kY0g5UVIrcTFvWml3TWNCTE1LUGJwdzRpMjdXWms2eWVi?=
 =?utf-8?B?TFJqR3VUNzZGVnNOUjNpUDNMNGJJU05GbnZEZjFhUkd0aWNtR3FoSHVIaTRO?=
 =?utf-8?B?aFBvQkx6UGZ3Z2YyK2JFaFdUMFVPNkZpSC9lY1c1SkZjM1NRaGJkQkJDVXgz?=
 =?utf-8?B?ZUNmaWdCS3FaVWRxL2FCMGwwNkhFMDRIVXhoamZrZmZlMVllZ3Q2R0E0cDdW?=
 =?utf-8?B?c25YWExCTXdkNmJlRmYvbUVuSnJIN3YwZVovQ21aYzlBYUVDd1ZzMGN5cWYz?=
 =?utf-8?B?aThWbzBFWmttVDlZUGIzbUNuYjZlaTltR1BZSTRYTzBzMzVYV3BncGkvekV4?=
 =?utf-8?B?UDU2cUFldXBiZW41NGxQaGFvdVJ1ODJEMFpEclExUlJiUEN3NGE1QVNoc2JZ?=
 =?utf-8?B?TXJ6WVNKVmpDWWhlRzgxTW9VWU1QazF0dGpvaXA1SW9nbjIxdURHcjcvbUhu?=
 =?utf-8?B?YlVGYUZuS0gxYlhKUFdDdlJodVdUWU9aTFA5aFlwWXRHTVNSMWhIM2FjVmJB?=
 =?utf-8?Q?fZ9oLhqJpGFrb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkVKZzdJVytWbWFXOEtPZUN1cmpxdnp5bHBnRnJYUHR0YWVxVkhkNVVZQ1Ux?=
 =?utf-8?B?Z0xEWnpORkNzSHVxa0E1VUtOd1paWnMxbUhFRmk3d3dBMmE2SW90Ky9Sc3dm?=
 =?utf-8?B?N296U3dFN1MrSWpYTVMrMXU0RDA3dkhkdnUrbmdVSlRuVE9ob3ZrZUVXMU5s?=
 =?utf-8?B?NmV4MmtRbTlCeWVCVDZXdlduYVI5ZlpuVWdDVzY0OEs3SmNoNnUybnZvWkRw?=
 =?utf-8?B?TWU1LzJITkVkN0tFdC9WMU1nbk12L0poTGFlcGlqUGQ1RHEycldjNGdMMnZy?=
 =?utf-8?B?Rnhzak1mZDRHOFhpOEtwN1h2cG5lZ2NnR1VzODhiUWs0S09UNFJMbnZtMFlU?=
 =?utf-8?B?ZVRoUGowU24wTytMZUpyQkVrK2FvTytWcEsyNmxNclMrKytQUW9DaS95bHVQ?=
 =?utf-8?B?WWQrY0RjUjk5bEJOV2dMbndRU2lienRzWEwraWRMVldicXBSZ3ZFVE9LWmJE?=
 =?utf-8?B?L0UzazBvSi84ZDErRUY1ajlCSUxKeFpOcmt1TVlMTm9Ta2dWS3A2bEROWVgw?=
 =?utf-8?B?SGI1SW4rK2ltcnJoSUdacThnK3VVQXBZdkZ0c0VVZFdvM3JUY1lVYjRHQmJy?=
 =?utf-8?B?WUtzUy9LRHZKaGlxdzlYYUxIcmwxeUk1ZkwxemJYMjRRODluYUVydERyT2xG?=
 =?utf-8?B?Nzg2WjF0dVltdXp6M0x0T0k3SUVzb1ZpallxTEl4VmM3YXljVnZ1WDFrWEhl?=
 =?utf-8?B?K2FaNmhZQmc1K3d3SFdJU2cwbmhEZzQ5WnlQcmNPaFRoRDBRanNETGJtOGlw?=
 =?utf-8?B?KytOTXFBUGJNV21PWEVOT1B0MHFxZzh4NWp2em9jVm1sNVNHK2hrSFhkSjV2?=
 =?utf-8?B?MUREMXdoTmFrNkU2ZVlwSVdWaXZEbi9LSjVVc2xsanFEOXJuQWpnWnNNUldk?=
 =?utf-8?B?RU1xM3pVam5nSkZZdUZvNFkxR1NQSk1lOFVkdzVIWUcrNzZnSEJiTUNxVUVS?=
 =?utf-8?B?bklaWlorM3NsRGE0ZFh3REdOL1dXYWh0WW9kUk8ybm9HSWQyVE9rYnZiZTZI?=
 =?utf-8?B?VlFmRjFPSHNiTEdBeHNzMmRLeHg2Y2hDbk5vRUUzcW1BMkxTVVhTSFJBN2dQ?=
 =?utf-8?B?eFVHaThOY2lEVHVUYkNIb1NzV3J2cUF4WjhsUjNPR0JjYkFzZ2JLQjB4WnhH?=
 =?utf-8?B?TmFpOXJrVndNdGVpTlBzZ1U0dXZMczRoUG03OU13L2JTUW1oTEpxQmVjY1A4?=
 =?utf-8?B?Y3FMb3U4ZytzcE5SWXBJa0dpdm9JbkVRd3NPMHNYeGVOSDcxenZxNEpzb0Vk?=
 =?utf-8?B?clVwQkxKUWR2ZDdBWXZ3dXdCd1o4RWJEUUh0M3pOM1pEd05HRFl4Z01lLzRM?=
 =?utf-8?B?NDJ2NHBWSHl1NFZOTVZyZUZYOTJuMk10anZWVmxTTnZ0MVd3UTJ0MHREYXZ4?=
 =?utf-8?B?MEZnNlY1OXVoZEt2c1pLMjRmaitvVzVMNFh4NU9mS3NOb29mWnBtQll4cnJ2?=
 =?utf-8?B?STc1RDQrT1VmNkR5djJQSnk2elFscUVvU0hWY1hERW5FdSswL213K3ZEUGFu?=
 =?utf-8?B?VVJlL2pPY1hNdFVoZnJPSG1PRjIrZXZvWXRqblBzOEVKekUvaDRidDc4MElU?=
 =?utf-8?B?QVU3OG4vWHh6Zk1JTjRyb2Fvb0ZvK3hNS09OV3REWlk2K0tZb1BMam0vTmNi?=
 =?utf-8?B?SzJXQy9UaFFOV2xBb0h2azZXeGhjVXdtL3oySlR5ZHV0YlRINVAxQ3MxMjhY?=
 =?utf-8?B?aStITUdyWFZZWUtLMHFuQWhTTlZNeWFwOElCM0NVaTBrWldYTmNMc1NmRU5G?=
 =?utf-8?B?L1QwdFRxdm5BRUtXY3NYMGNhWXdTdE1nd0k4TXk0cHVxVWFCWW41SlNLbHBi?=
 =?utf-8?B?cWppWjB4WjNMazFpVzhFVmhaREwxT01TR3ZsRlhHeW9OUktuRFJjb0tBUWc3?=
 =?utf-8?B?cFBpeFZyZmszK2M4VmZoT1NVdjY2Mms5TjF6eDRSL3VwdGRxdVJBUlFnWTVD?=
 =?utf-8?B?QjJWRzZHRkhPd0I5WGREL3gvU2Y1TkFqWjE3RFk2QTZzcU1sWER5NTBrY3pM?=
 =?utf-8?B?ZjZSd1A0NG8yTTJJNjg4VkU5Q0o0L0tKWHBvbDBBTENsZVhzemk3RUdLRTRQ?=
 =?utf-8?B?UFlSMlkwakp5eWV4azRRcUx0S0NIZGd5OHpUK0JFeXBEMUVYejYySUg5dVFQ?=
 =?utf-8?B?bVpzd3ZSYnFMQ2NQVmhRTnMrK2tES3ByMGh5RHE2QlF4TDFYWmhXald5eHVB?=
 =?utf-8?Q?Xg1GwwKGuy5kGJwKNdsWiAI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 73da289e-7ed2-4c5e-25f4-08dd47543717
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:48:38.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Z1fM0pKincLYTIH5cntieuyFrbT8A5X0ZX7BVp7QwA3WnPuqbPtEqCktBBbx6AER36nREeGadaS49W/Cr0eWPfDrC5w9wjekI+ThEsUa5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9354
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6275

Hi Antonin,

On 2/7/25 9:27 AM, Antonin Godard wrote:
> After commit 0fa0d8d764bb ("cooker/cache: Drop mc 'default' string
> value") in Bitbake, the default value of BB_CURRENT_MC was changed from
> "default" to an empty string. Document it.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

