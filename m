Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3CDC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 15:10:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1198.1783696202133537493
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 08:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZgrBvIOL;
 spf=pass (domain: cherry.de, ip: 52.101.66.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKRfxDh7jQknfwkuW1b21Q8EPxmA7NwA5Z5krQY6L8w/OYhRpSQfy3T2O6dLwJme2P85CFhuhP4Glsqmq74roxr9sLqT6ptWZ6l8IcoISjA/+bTgCycqJAd8609oWrREBzEuI4EWahmobcnGcGaoBVNSvTrquFG6s35v2KleQFAWQuu34lpwhqH5y67/iPr6IxRWIopOspAHcNx0z56fI49hD3drhmmOae3COHL9YbJe9W0E2FPEVs7kAl61HZo+OP1ByO/qKEeRTujL4GIqTCA1+fmpjFGG4N12ZxwylvEoJ2D3WTLQBabqNV0KqXwf6FDf+X6YvvWe4sH92TBdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGNLxiL1/WlhgnIcABAYX+gsLODtr8nZiRnkqfEdUUs=;
 b=pOg94+kXooZXjA/p/3j+1Bp43Nw3/i/cZ0YreqjkrtOFMbufPrlo+DQTiubcdEsxJrL9jpij0A/KYO1BBKdzM00Ym2o3HP2MEWM0FxPEy0BhUSPiK4EchmvoLlGz7JRLedSOEWW3i/85fWy+Nkfc5vaPAMAG2wTmJWZWVIpLPBB+44KulQDjyvdGOzvtozld6B4aXA7Mc686na9MmFpMJv3Fux2aQWM1RuEUXMcC5h7JPWH1ZrfYOv9Fx+TXRSfWbo19WJrJ6TK+HeGOu/vdqwd32Liuutu0ZhujoCiTaomgz6AP4RHmOxytyYWYnWxLwaFt4J/x5viwQXuSU6OrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGNLxiL1/WlhgnIcABAYX+gsLODtr8nZiRnkqfEdUUs=;
 b=ZgrBvIOLGAqFmZolx7xkDMz0RAaJpmudcbhuG/1yf+9nN4GlROEgn6RFKGjS3dJe83ZTAPPevK2Uh7CvrMeeEDzHYSvYSbT4eC3NVegNun8l8fS/2SP1klfmBQJ/89+/eyU/TARZ1SigUaL4dMR+RChtSeW5nxpEcZpaWp6azac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 15:09:56 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 15:09:56 +0000
Message-ID: <a72acc48-890d-4a9e-8b22-5d02b5dee589@cherry.de>
Date: Fri, 10 Jul 2026 17:09:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/8] conf.py: add linkcheck builder exclusions
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
 <20260710-linkcheck-v1-1-999168371d5e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260710-linkcheck-v1-1-999168371d5e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000525.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::679) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 401d1491-2b87-45ab-b53f-08dede954d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zMvH6TvdTaC8/ImFdFNjOBYBc1ahrisoN63pPs2xc57A8W/HRVqBfnt4tMdmfk7knYPgBUJ7kxPp723QdBF31/D0Qn4HJhHD2AAJACRxW8yxTHtN+R4L0Rp+Tov5Jf+uxv3rtvTKPvRnUfRBDcFazYZ3qmun5RpVTIXFkjyA8gXOBihDhzMWEh+XsgwMbjugea7k0cWdsYhVcGiBnhNw/Tdc7yD6ChbNTSxrYmHNDr8Q4E093Qaw4hKfqsgEgwsHFOA+AaOHvwD6Q6EMw6mjw1pxhvueOFhvkVftyBYdWuP0b4Dhl+YKTKdACQQb+5K9TmprSvR5Qsovmgn4K0VH0N8y5X+nl6zQ2+dF7H2Bvvz+8J3iOhrV8DZLfR73RH638Q1XTGpkrhkxrACTO4hOi8sLvJ4DyYx3VQyhMzNRdgrQrsN9B7jp0s8Jy37mLlpi4Ldc6tl1DPWbn6fnd+3BqhtmyWWvyCPN8+uKd90gEqXCYt0OquQ2TgyuN4Yfn36RkrTa2aZCjWIaRYSiR+Zp+C6UE+7BuwnRQQbTWa7yGR9DFV0Q1no4wFUBCW4v+KQfvcPYoEq+DAA2pe+C9MG/gRS9380xOcRtWyqXkI64L1Xjp+iqMkkLIfgC7NbXICdvWdfLuRNTbKOves5gT7k5xADn543y54sLyUC/z0po6nc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dURYd2R4UnRuTG5hTHRDQlphRU1IMGdVUW5HRG1YRGx2YUN3VXlrcytGeXZx?=
 =?utf-8?B?SnVqN28vYnE3VDRHVjduZ1JONlU4QkVrRVdFOXNNNEFLSHlTWGNnaktwMDlh?=
 =?utf-8?B?MHd6cUdzV3M5R2MxWmt3eWJZNFpWaDhESWc0ampjR2VlL0Z3WlNWcVZ2aElJ?=
 =?utf-8?B?TTdqeDlXblNqVk1EaEpIOEV2WEVxQnpUU3Uwbk5ZRnZXcVp1Uisva0RaN1Jo?=
 =?utf-8?B?UmVCUkVzWlVxRTludHdoc3FIdUZsK25kWExkS2pyaFNMeDFVa3pWTEpBR3Rh?=
 =?utf-8?B?aU5xMnM3MklPRm1oeHN5ZC9mbzVVZENGWFE3ZUxPUUN3ZlpwdjJnSk4xS2Fa?=
 =?utf-8?B?VFB0LzFYcTNYa0hzY2cwUit5S1ZPK05xQlBaVi9WbGwzWDVWVUFWc1QxU0FT?=
 =?utf-8?B?VVBMWmgrTVhxbXJGVHVHSTE2ZWN0dDZveStFQmk4cTRPbVBQa2RUK3FtSTJv?=
 =?utf-8?B?Vit6Y3F5cnlReTJGUldJQUw3QkhnRXR1dzhSdHpsS1BDQnBmNGppK0FEVkFK?=
 =?utf-8?B?R1BqbUc5eGRBNy9sZjl0NWRWaHQ5TGRIYTFrSmRQV1NVSUJOejNWV1FzaERJ?=
 =?utf-8?B?eHB6T2V2c1JMdWl0ck1lRmQzL0JVbWx5Z0UwMzJqb3h2bWZIVnRYQkswdnRD?=
 =?utf-8?B?Z2tXcmR1RDRDem0xZTJpeG8rcWxTbWZheEJ3dFl4bVpSTGlHVlJzZTRubllz?=
 =?utf-8?B?Vm04bVZ1c2xzZytab0Zpc2V2eU1aTDRQR251aGhCSU9EQmZuSkJTa2JFMTIy?=
 =?utf-8?B?Rzd6S0lpQUx3eXJ4RXVEYk5hdnhldkJodVlZUFBiMWYvdVZWLzZmSkFsKzRp?=
 =?utf-8?B?VHNIMEJqa0pKQ2E1Vmc5WVhWZnNiQk5HWnhCbEdyRXZXL2hIUTlJUnZqTlU5?=
 =?utf-8?B?TWVvbDY2WlJPZXpkYkI4NXI0dzVqRVlMUldkZEdFbDhBSnJvTTlHeHFvTUlQ?=
 =?utf-8?B?aDcwVWp1aUZKSFhkYlhZTnNhQjkvaDBWQXMzTVdkZnlLbExaN3Z6bTF6dlBF?=
 =?utf-8?B?OVYwN1dFcHJNdWZhKzdrR1ZhMXdRN2FEaDY0U0RycmJDZTV3djFlcklJZStJ?=
 =?utf-8?B?OVdORWFRMkdrckJqZTQ1c1lHOXBscTBnTllQVDUwOW1lcEVRc3BsUWZYMDJ5?=
 =?utf-8?B?UjFSMnUxU0ZGZllyelNJZVU3VTd1OVdpcEdxU21VbmdtK2JGTXRFdzc2UDM3?=
 =?utf-8?B?YUJwL3BTWWlQZkMwUUM1QTNCdkZ5Z3dWczN0RWIyNWRxRElENWRWR2IwVnZq?=
 =?utf-8?B?V01MZWNPYmdXOHJzSjNYckV0bzJTNzRRb0kza3R3TEVPeFRUcHI4R2N1M0hl?=
 =?utf-8?B?MVFUVWxnTGpRMjk1OXBUaWN0dFNpKzRoWjJtUHEyU3pQdUJRa1NyZFJnVyts?=
 =?utf-8?B?VFFMYnBEU0pqeGZsN25IYkkwSVQvTU13dEd6OWQzRFg2WmtvSy8xTlRVTnMw?=
 =?utf-8?B?Y1VVeG0zZm5mSlRwalQyb1NYZnRRdW9xQXpLZmdpN0plT2xTUFgwdGQrZ1Bv?=
 =?utf-8?B?MlVpSFZhWTc4MDZZUE5ISUpxTVZINllqM0JqbmtVWHRSQi95c1ptWGJYOVAw?=
 =?utf-8?B?S1pPOWJCenk2Z1VyODdWT3NNaStmZ3RBMzdWb1Y2YTdJL0J0NDVFN0puRjFj?=
 =?utf-8?B?M25MUWNrZngwOVB4Z0dhbnRRSjdtS0pMdEFFaU5PNTNVWkRvQ3JXYTNVRlZM?=
 =?utf-8?B?S08xVHRabEYvYnMyTkRXY1NrUEtzQ3ZwYjZEeTRxdkMrM2dMZG9pZnFNMTYw?=
 =?utf-8?B?NWxmV28zcmRnLy8zWGUxR3I4bGh4eEFvVG9oZXQ5N1A5UHB3Vk5Va1BKK3c1?=
 =?utf-8?B?NExOc1ROdHhJejd6c3E1V2lkbWVCRWxRWFV4bE52dXBZV3AzNXJnZC9TNWtm?=
 =?utf-8?B?SWUvVDA1M1JmU0ZnMHJmSHM0T1pEN2xFUGc0SGFCM3g5cXdMSFFxdXA1VE9r?=
 =?utf-8?B?eGZyNUJRQm9samE2UW9ybENMclNjcjZGbzgwZ204aExwRVgwaUt3Q3p3RDFm?=
 =?utf-8?B?RDROQ1FNRVVEMHlHUU11NEpiWmx6ak1oWTJyQlNseGE3ZWFBQTBoNWpySE4x?=
 =?utf-8?B?ckFPaDlDSy8xUGNjR1lSWnlsSHRROENESWFYZUF6V085dC83UkpTTmdleTdF?=
 =?utf-8?B?aVJWdzc0cE9BcWUwM25pZVpsZFc1eTBleG9hTjdxMmE2OVRSYnVaWGRsRXgz?=
 =?utf-8?B?ZnRjeXpORXN1eU9FTGJRaGJ6b3hxS1pDQWRYRzNMaFhqb2dJMk9yS2p1aWhR?=
 =?utf-8?B?Zklkc0pFS29ReUZZSU4vSWhBVW5NNXRyWXE3dWJFTGhLSEwrWnJHbnpKR3BZ?=
 =?utf-8?B?YldnWjNlYVJPZFFPYWVJc3cwd0Q2YU94b0pibnlta1pSVVBkL1Z5UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 401d1491-2b87-45ab-b53f-08dede954d6d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:09:56.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLiG+znipeeya6QfsHj5+nIQP3f8QIUX+ggA5VaztRLcLq8YU93DZqDtGcXskouul8WzjWe4yDi5uyV26Xoo99n6QO8Fdfe+WvD1Hy6WC4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8298
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 15:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10065

Hi Antonin,

On 7/10/26 4:46 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The linkcheck builder can be used to scout for broken links. By looking at
> the output of:
> 
>    grep -E -r --no-filename -o 'href="http.://[^/"]+' | sort | uniq -c | sort -nr
> 
> from the HTML output directory, exclude links that are too frequent.

Because they are too frequent it's impossible they are broken? 
Considering you fix links that are in this list later in this series, I 
don't think this holds. At least provide a proper justification because 
"too frequent" doesn't make sense.

Cheers,
Quentin

