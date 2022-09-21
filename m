Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043B8ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 08:37:31 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.50])
 by mx.groups.io with SMTP id smtpd.web09.4107.1663749449130902850
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 01:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=TQkmFsme;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.50,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUCFrSeI3QlanErravnHUEV9bBY+3X04e5ZU8ZCeoG6u52e/UG+oNmA+UEXQipVXqH4d6If/XicR5Z/NXZJh/dFgG7XCEiyuRiNNuHo5ofJI4t53b7mFhMifgx+wkXTdHdViMbNWERtXFqBRKBnUqFZRmTaWZGaByOHDyyDyaTlGLwXNI91aFkxebFnHf7j/51EztxAkyLU+VmoHxLc/qHEJ5yjDCEJW22RGBhhAI/Mkfn4+bzzUqPRGRu/tN2HBD+nfSJME1qlHnXFf4HSiaOpzIKakiAx5Hy+20uaQsqW7Qs2bqnSYqkcAl54vteJtRxtGXlkIEeYKU486J0W4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLovhEIOC5LXmVeoJzIiNbgxLowG10VGBpgERlKBZ9M=;
 b=Qrpz3ge1Db/7tKAGZ+QsTyHZHmFUwbB4/qGk2QQHL7ggeLwSIa5a1CQG0KMZucZ71ASLOKh+QPpYw0FMuom8gg4RBoskI4S19HXYzY/rk/u4VYjONtuWb5ZQvE3Hi04HG+hd37O7dqfctr14EYZG854wQAD24Bdn6wa5U9oclnwN06KjWxrQm2u3NV7cY05K9dyI5SkYm0Uw6KvYPhN9Q+eSz5DLjFw7bBgD08jU9VHCsRSviK5LjMEhDmxXFvqC8qMlBQYYQy38HxFCVckXWgqHgeXe04VexMWtSuUf0A6kygAU6tzHZm4tnmSzDK39zSLCC3ABQdjANb7djzp4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLovhEIOC5LXmVeoJzIiNbgxLowG10VGBpgERlKBZ9M=;
 b=TQkmFsmeNAA5Sph8eAEv84x2xzDDBOe2FabVgZiuu+4VGnNMqoQcmvqaCJ0LYhcPGNXAyaY26mKrySNN8XkHpbmFxyW76Tyk48vsUHDD5wra/3ra8iL3Dc+VxQbnLcahwplWljdaT6C4f5KoaClllVgJVGSAmfWKXCFmdQI88ZsUfqpXFNFY9gIDLqj+nTs16hmDoLZ2lXshm8n27yOKSByOoP0e1GBYSgHu1RD8ZUgUI2j+bgvxUwGFMUq84X0Svz8OY+pPQntUAvhjSEoIMflTItOEF4UPMj4zro0Rbt1j00LQfMJQyz7/w/K+87SitZP3aPdBQ+qbKnXKDYcibw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB7017.eurprd04.prod.outlook.com (2603:10a6:10:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 08:37:25 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 08:37:25 +0000
Message-ID: <c869607a-b115-b0c1-1504-ad8bd68576c5@theobroma-systems.com>
Date: Wed, 21 Sep 2022 10:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH v2] ref-manual: variables: document
 KERNEL_IMAGETYPES
Content-Language: en-US
To: Johan Korsnes <johan.korsnes@remarkable.no>, docs@lists.yoctoproject.org
Cc: He Zhe <zhe.he@windriver.com>, Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220921073035.11141-1-johan.korsnes@remarkable.no>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220921073035.11141-1-johan.korsnes@remarkable.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6833d833-a564-4932-48d7-08da9bac8243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s2CXf9PWgFkbJW9XxYHHRzea1pOvqBPYQyVBDojh9Y1BseFh5OrmymbA6ZkL0mTTy6IC7qe1oywhrbhCJqCbfdJnmJL5QAhmUGJEbxo2yDeg9klK4bPf7/TTYVPJmnlZWmf2F5MLThu3zCesIb0srAiw40gASmx7TYI07z/LMkedqS3832sWQoxC7uaeqeNJ4PpC6vPlp/QfB6ayQFL+EKyVNSh2OOMQUmvobl82LIOrgpny5bSXwkKuVZrQmAi7GvsNZqhacbzsy243CWUCdc2pVy3YUwn35GeKFGw9s7IFCBwE/P7sFj3InxJPu9FTMr0GKRAauhCGCBlWbLVMA87fZK88yBF8LaOAvzsh41bJ75Hy2x/mCIopZaPaFmrZkxE1vqCjBXTYRjklLwsKkqJ3SypZ14AjD1tc1lr0zJ1EuAeZg2cQFSEnvqQAda3xpma4YzSMcSx6tQzQ2GB8VRhhqxYWBsnuSoxG2Aq7kOOhkD/RfkC5G+AUiwxb/lEiPvfg3PKHjbIm4G3Sc9PnEEBMj+t1SF3nwVDwr3Jg9/AlaKqv4zKklPEWCKJpI3mzq042w/yRL+Y7t8yT3MqjCqejKmiQOgdrOKY23EZ7OHLTfXmyZXy3+2LAodYmMrhtbNo5/5DJrmE9nGrsJgoTgp+caJIxh9VZBqJwr3U9rtr3F054aBt4gY31ZPokASOinQL/TZ7HgvB9vJCQ1Xg0LHNku8aH8bLqVO0kWEL7V79lEV7/bVh+f5Vg3QWA1aD8vk/W4iaC4Fw5ru5vS//DQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(346002)(366004)(136003)(39850400004)(451199015)(86362001)(2906002)(31686004)(4744005)(44832011)(54906003)(8936002)(66946007)(316002)(8676002)(66556008)(66476007)(6486002)(31696002)(478600001)(41300700001)(5660300002)(4326008)(36756003)(53546011)(6506007)(2616005)(186003)(26005)(6512007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnNpTVhtTC9iUDdZdEZjamFtSEVhV3hocllQZmxDOGRjdkdnekpEYTJRaUVi?=
 =?utf-8?B?enlVNlR1N05JcWlHUW9MUUJjbU9kQ0ZyVnA3NDNPdHZKMVNLWTJIS05pdGpG?=
 =?utf-8?B?TmFvRVpzMGpLT1Y5Y0UxNjZReGM2TWdqYld4c0dqRzJzakVpQTdWNm5vWElD?=
 =?utf-8?B?MGRLazlsQURkWi9GWkhxVUlvRmtrT2RXMFBtWmJQNXQxc2o1RXQxOHhLN3Zh?=
 =?utf-8?B?eUpnb0dPbXkvUU5pTFBGUXhZSFd6UGwvV0hBR0dOd0piZnd6UmwxRXdZWVh4?=
 =?utf-8?B?SEJmcUJXT1dhOHZrTjJGVGVXM2g2MGdOWTBDSXA3U3dqUzVWbUZYSzNrMWVH?=
 =?utf-8?B?RnNOTkdZeWw1N3Z0SGpZNjZDYnUzMXUxQlgxRmZIMTl5a1BQU1R4djc1UmYy?=
 =?utf-8?B?NHQvZytNQkRoVjJZaUJ5Vm12em9WZFhCVVd6YzA3L0U3NkFUY0hZNUxISEQ2?=
 =?utf-8?B?UTV5dzlNM1U1UzgvblVHYjhBZ0VpLzhTQkcycUVVbWNLdUFEdG5xOW1rRy9V?=
 =?utf-8?B?R29xdWhPWk9nNldUU3RUa3pNWTlta2NlRzhIRkdlMTNYSGhDNXVEZEdxWUtw?=
 =?utf-8?B?UUx6TzRjTEhsYUhmVkkvSWQwT1BhNHJ5a0dMb1BCVk1TNFpEalg2TFNSYmlt?=
 =?utf-8?B?eVZjKzlXQWtVMWxyMFpSWk9TdlpBSGJYdk1Fc2F5MngzZzFmQVdHbi9vMXhB?=
 =?utf-8?B?YUJQenp2aUI1L3lBdTY5WDJWazFQQ0o4YUlZL3dNOFQ0SUV2bFp4aitPc1R6?=
 =?utf-8?B?SllSejR4Um9RL3hZemcrdWJFNktJRTVkbnlpUTlhWlhuSHkyclFMMC9ZMnJn?=
 =?utf-8?B?YkVjV1FSNWFvdFpyZHBFWk1lUGtuUytIVjMxOHg3N2JLVHpyWDhNeW5weHBr?=
 =?utf-8?B?NkZPb3A1QXB5QXM1dmhkeDhiVkh6Nk5oQ2VBODZIVXFhUC9BbEZQdTJnYUhF?=
 =?utf-8?B?cU41cnpHOFVMeDZMSnc5Q1Fwd3ZOSTMyeDNQUkt6Q0hId3I2MVdxYlkxdkRQ?=
 =?utf-8?B?UlAwYkhzSU1rVTRiNHFCa29PcUJHL3MwaElncnFONWNTbVl1UjJyUG1nY1cw?=
 =?utf-8?B?aXlUZ2R1S0xjN2RrSi9NOE15NUdtYnJJd2cyekgzcmI2SUlDVnVMT25SYkJa?=
 =?utf-8?B?SEN4c2p0cWRWZlZvZEpGVmpjRm16MHdyWm44cXM5eVZiTC9SZDVxS21kWjdv?=
 =?utf-8?B?ZjlvRS9DNDMvUDRyYTE1ZkRrYWNVN2dtN0NORytNN2VCNmM4NjgyU2ZtYmM4?=
 =?utf-8?B?eGVDdnBQcGRnV2E0dHU0dnFDM1N3dmVtRHh0VFRwMzR5V2NLRkdnWWRDTDVy?=
 =?utf-8?B?R1lmL2UxUGZvYlpFNEcrSHRxc2hiNkpGOGprU3NuYkVVSk1ZLzFrZHV6VWJ0?=
 =?utf-8?B?Mm5TeXBYbDUvSnNvRGlJRjltYXFvZFZUM28rZXBQdkx0YkVWeVdqaDhGcEZS?=
 =?utf-8?B?UWxSODRxcERGTFkvb3BjRHZuUmRBR2RySWlnSFhmdGVsZ09pZ1ExMUpqM01z?=
 =?utf-8?B?RU9EOWJYOGQvSjJXRHlNbFEzU0VEY1RUU0hKdS9rZEIvNUNlY0g2MjJEUG84?=
 =?utf-8?B?RWpvM2IyT2p5eGF0Smc0a3Uzc09IUjVaNEUrSXdVK2lFNUl2cFIwc2N2ekRL?=
 =?utf-8?B?S2hRZXNXVWwxakFaTXprNEhlSitvZytYWnNFL052czd1RVVaekdLMjB4WXJt?=
 =?utf-8?B?ZUY2TEF6cms3dWZpR1RpZ2pkNUt5QURwdVBwOHpBZ0t6WGZZN3AwYjE5U0lz?=
 =?utf-8?B?UnZJTC9ablIwRHMvUG9wNUNkeHErUDZmVGI1RUUvMm9HUU5hNytwSjF4QjlN?=
 =?utf-8?B?WnViaTliMFh0ZkljNW1VbkpiS1Z2T2ZZOVpycmV1cHhEY3Q5UkJDNlNJUnFt?=
 =?utf-8?B?WDcxeEsrUHRhUnE5c0Q5enQzS2pEYnRRdng5OVNveHo1N2c0dGxDeWJxQitD?=
 =?utf-8?B?YXJuRUdpcG84RHlLSElkSUJsWEVxK0piS0ZvUUpxblVvZXppREQ4ZlRaenVj?=
 =?utf-8?B?L1pyaEVxWFFZajlickxzWnFESHVMeHd2TUdBcXhBTWkvN2pHeGhzZUxaV214?=
 =?utf-8?B?NHBoWEdIYllTNTNxa3VYNEpoeUw5d0F4bk5XaHY4cnliUExvSEZrdUZHQUt3?=
 =?utf-8?B?bUE5Y01UNDk0Y0QvaG1zT3pWWnV1YUoxb1Q4YmNtT3RXZ2F2bzd2N3FzaFFa?=
 =?utf-8?Q?HCu0Z2sYwtDACFJYZi+r7NU=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6833d833-a564-4932-48d7-08da9bac8243
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 08:37:25.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 l3sczEvu1gHhp+mzeQg5EyzocpXLgHEzrkXQHu4zptgjgxX+que2HAVLTP6pyaVY+BaWBOIsCg4IZFHHNvm/3OORCacbnineUNBRHSLt87BP51Ck04v5d8kFrzhoqm5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7017
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Sep 2022 08:37:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3195

Hi Johan,

On 9/21/22 09:30, Johan Korsnes wrote:
> Cc: He Zhe <zhe.he@windriver.com>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
> 

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks for the patch!
Quentin

