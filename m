Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AAAC32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:11:20 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web10.29540.1661242277151443408
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 01:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=kExpOkzK;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNGGHyODQo5myMHjiM2I47WyjfJ+q6X6rFlitJmmqhYC29wluipzn/+KU0wqL32hlZKchlPemhvHMEWe9itvNeUXkOL0Ei/xgqxKUWGCYE1DzUMfVTXNJ0L6oBHqInFVxGa2/25m6dzIh432LXWisgMWUYYQmcHK0fjM7CcxGi4yHx4zqY+OUlqUPnGawN6lylfe99Cuy1RBXw2vU5/XOcEaEBLN8g0cVq+6I2xFx+z6AsyhggvswzKMDd40q4laaVxr3Xn8kPfR6iHv+2Tfy72929sEC2KqXniSG5Ok1XcXgnwR+oc+2XGTnbTclbheBqzKfUZLxFBFT0hR6D9rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+dIb9FeehGZyKmLT7gWzLyerDFsAiqakKbrQWlf0G0=;
 b=U5PvPmoITCFTd+J5hwwQkGMBTyme1A+EXEVsG6wVs08OM2G+u1xUu9IiMgUEGlrtemdqb5msYYl3ZC5lqaaF0Bn8uWvN5n07UdsaXJMzh80noFYL6Z1gFLDWeR038TyXPi+TLh2cZqlrw2Cr8z3u8I9zpjG23AOU3CqR+mCLPsPMjFveyx1j930cnmC8EXbqRWTGfS3rsmKw6by0aZymQ3WOsVCRoTEccmllyVU4lfN5WkoecClA8zXozxryLlE80PFZEwrZnVsKW+S32cLIHSW1GLnY99s7KepomMGlp0thpkAgd5Pnz4AkkVPYREtju9Ns6qlZtwV9nSZvfVL9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+dIb9FeehGZyKmLT7gWzLyerDFsAiqakKbrQWlf0G0=;
 b=kExpOkzK1zLcCBAZP4XTracbqhOS7ql6p/ohoL5Ig4jI1q3a62hgn+PdrRzUxLo3kmuZoB9s/oUi7oOB8JemXLnErl2FNMAT9gzvkyv5uObr0dyrqs3pwMHwr/ErVmjIEIgVaZujARQn8zL3FtLMIYyJ8BAjeWR0rApiMcVfHs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM5PR04MB3172.eurprd04.prod.outlook.com (2603:10a6:206:c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 08:11:09 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 08:11:09 +0000
Message-ID: <207d6c62-84c2-5c63-dd9d-aa866976826e@theobroma-systems.com>
Date: Tue, 23 Aug 2022 10:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [docs] [PATCH] ref-manual: add numa to machine features
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>, docs@lists.yoctoproject.org
References: <20220822153807.3806687-1-jdmason@kudzu.us>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220822153807.3806687-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0191.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::16) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d2cde17-ea2e-4c6a-fff8-08da84df0958
X-MS-TrafficTypeDiagnostic: AM5PR04MB3172:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	54g+Kcts2hfRPZqGlMO41O5SArhRR/TfZYlEdTBQ75uyz4PgSBMCfZaRtsInyOSm7+c1JJVWq0mBcpKrlUzi9JZsB/do+q0YEtVGfN9piBQHqTLgVbDyyfwFSjxzFsO2E3FNgkbJXxrKD76A9DzEVI/+zE6hLzIpET7pToU5soHr6tzakLCshwB06Hu+Uk6DbaMqY35pugPI6qeiD86R0KYYE5VSpY84boppNEibTVeStDDZwqrIxjs44YiyPZ2mQeP2kemNz0IUhivQb3og+n2O0jkyFO4rUvZYgyYgEDGuAzA/7k4JPA4gtVSSOyhmbH98dQuqpQDKCB10rvDhIR2PKAf5jNfvMrrlmroPSYzCsSwjj+bES2AG6u3KdGIVpBrRX2BE0eaKG8804NW4YkqemkC2gxg9M0zYEcRPp8Z3az7E6EdNiJe2J78oAOQx32SPyXUggX80O8WANPX87Bu+D++E5MlgbIg1earOxuC0G8PyzaEbgzPU3QvR3tuiNvVPlq+SmEHzneUbbcn5Bjh7IIEB1HmKcAmIYemgew0kLdEax5hG58u/gAU79xL9wvLePN5cpJp3DuIrgJgBudJjvKMhvIeKmLsv2QrUmjopJkp/MD1Fk6me9Vzsszmc0pc31DwfmPkXPvjHd9WRMCPNaFwb5xBpkV3gYiSA1w7OBV9FugxMwe4OS2QCz6fdS2AZ/hUNCkXEbX9uzm8qd7GpPokWwkxiFS2fFcQGONFYmGehqOA7IBVZIjVMSdlrVAnxkpf4UdpGRYW8P9q4ExW5KsBTkN2ii1g+uJlOJvs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39850400004)(136003)(396003)(366004)(6506007)(31696002)(53546011)(86362001)(8676002)(478600001)(66556008)(6486002)(4744005)(5660300002)(36756003)(44832011)(31686004)(6512007)(26005)(186003)(41300700001)(2616005)(8936002)(2906002)(38100700002)(66946007)(316002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RkNNZ1BrS2taNk9QK1FIczJSTk5CR2lkV2ovWXBYZWRZTSt3Z0tXQUp6TVNJ?=
 =?utf-8?B?cXRBSGNDNHdSVWN2aTN4bVg3OXhUWDF3bUJ2NEw3VisyMU5BVXBuMjB1QWtT?=
 =?utf-8?B?eWZaaEtqYldKU2R3Qm83YjZPY0Z2d2FRRUpuckl4T2VXalh0Tll4N2J2VGcx?=
 =?utf-8?B?d0RVMkhyZFpJRmlwblpZY1FPTEtmQ3Q4QjhkOE1NeXZqRlBPa2ZFbkQ1d0Ux?=
 =?utf-8?B?cEROYWZleW91OTNxUTkyVjBySWQvc0pDQ0NHRWdQc1gxK1Q2MHhSSGVQOGls?=
 =?utf-8?B?YlllQjJHVFF0SkJjMXkrWGh1SkNhYUQ4czh1MEkvdng3SEZ1MWJhSHZEbmkv?=
 =?utf-8?B?NEo5WTFtRmpnMXI2ZnZQc1c2YkFyTmhBbnRBTGRWUStSV25xVHJPUitEWDkz?=
 =?utf-8?B?WU05ZGY4NG1wYVNQTmlyZkpOOWFZcHlMbTJreFdKakpYcWFkSUhYMEFzRzVP?=
 =?utf-8?B?d2lDaW9yZU1hUDhaWEZLeTBBSTNGamUzVzcvT1lKWGJZMXFOa3BBQ2loQmwr?=
 =?utf-8?B?QmlHL2VqK2tadnFVZk9zaHJsWm9IK0x2cTRxRFJ6bkhETEdFQlhSdzZHOHcr?=
 =?utf-8?B?QW9La1RJMGlQU2p4SWhPQ2FWZzIya3hoZFJnL3VmNzFKekt6Y0Z0dmpOZnkw?=
 =?utf-8?B?NjdpeWFCOEx1K1dOMS9DMGZJNnVMMXVLclEwWUJ0WmI4VElkTlFNMDVzWmds?=
 =?utf-8?B?aEpQMkVza1IwRSs0dEl4a0p1R2Rxa1pRUWRpcmJCR3FNN2pmVmZTNy9UUnJ6?=
 =?utf-8?B?TktzQjZVWHc1R1YwOEt2TFk1eEZUMHNSWHJnblk4Rm1FdG1YbFRlMWF5Mmdp?=
 =?utf-8?B?aXB5MG9XdEJYK21HUFYvSjdLYyt0ajBnTDNkekxqdlMzZEUrMWkrY2w2L00z?=
 =?utf-8?B?dGxsWjl0QXBHaGE5TlJmZzBtN1FKQzF4NGdoTjF2UjlRb1M2b3BaMVZ6ZWJt?=
 =?utf-8?B?YkJZMGUxL0o1N0hpamI3MnUzRkhadXVncnByWW9PMXVSbGY2bkZwNkN2ZlVj?=
 =?utf-8?B?bkdnODlYcUtiYzcvVStJOExRcEdUanBkKzRzb09Cd2QwVlpaeU1helVlMldN?=
 =?utf-8?B?UGlTazZmeVFNMXhKTXF6eEpSd1ZRRUZYMnNSaEttK0svc2VQQkRYVmF5ZCs3?=
 =?utf-8?B?VUhTWExUejdkTWlaWFJJR1lmZ1hRSjlKbnVRRVp2elJwdklwK1A1b3JGMEEz?=
 =?utf-8?B?SnIzTmN4Nm5NSFVWUjBmaTB1b0gvME5YalFIZS9JNzhEYllmQTBsMDhKU2ZT?=
 =?utf-8?B?d2RRRXVJYXN1dUdJK1NSb2V3YW1OQjNTTDZGaVFqMXVvVy9JMmtaTk1jQTk3?=
 =?utf-8?B?alExTXdXVHFsYkZHSEtqTkE2UjhMc3FaZy96WWw4ZjZWa0k2Y25abFZicHpV?=
 =?utf-8?B?WnozZm1CYURxNVh1cjJhM1VBbERoN2EvaGw0b05mYjFaNTFQMXR2OGllUVVZ?=
 =?utf-8?B?ZnNLVkZ4dnlNNk43SzhEUGRJOCt4K2w5ZHUrc1pUV3RuL0FDV1l2bUhmYWlk?=
 =?utf-8?B?VWgvZGgrOHp5RmRNQXV6RWFmVHVQRDMyVHd0NVJiYS9JMWN1WVVtd0E0Nk9D?=
 =?utf-8?B?WURnbWE2L3BrdXV6b3Z1ZXdWWEE4M1BsNUpZWGhqVUk2aityRmY2dzAySndW?=
 =?utf-8?B?Vkp6Z0NMRnlqZ2o4c2pkMTFZVkJ3Ky9KRjNKSUIvcTd5blpJbG1GOXlhbVdl?=
 =?utf-8?B?ZTl5T0V6TktJSFhzenM5WDdidnVEYWM3c2J5MzUyUXMrY1VxeFk3VnVhVE81?=
 =?utf-8?B?RDRuTHJHL1RHZ0dsbWlQSld0aU96SlZINVM2Rk84ajJFRm8yd3hSWmZlMzNz?=
 =?utf-8?B?ZXlBVlJQbTg0SFFmK0pScm1jUTdmbml3TmU5U0RTMjRVMXlIZ2l2MG04OEcv?=
 =?utf-8?B?YkZnUWFuRy9aLzF0MFJEQlViVFd0Y0FzMVdFNEQ0bU9ieHhlWUhSemtjTUlp?=
 =?utf-8?B?SlJxcDA1V1ZmQldlekN6SWtpQWhyeGU5K0FNZXdMY0ErdVdlRm0rTGR3a3hr?=
 =?utf-8?B?V0lDMUdTcVdKV2NrSkJzR05CZ0t3VitWQ3I5eU5ORVpvNE5OQ1N3R28zMVZM?=
 =?utf-8?B?b2dIRXhITkNNVXZLYzBEZW5TQzRFQk5rYzV0bWt3UzhXVFgzVkdFYWZvcDJJ?=
 =?utf-8?B?UGYvaGFUVnIyVEJaMHdEUGtkOG1sK1VoVVFXOXZHSXBTQytuYUx4WWdtNkQz?=
 =?utf-8?Q?m5FFSsNSs40XlxsQOSuyBOo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d2cde17-ea2e-4c6a-fff8-08da84df0958
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 08:11:09.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kvkwiu9orUtaeNlR56e+lQjC6T9OU7HoMPenvNAAbuCFU340Du/BSl369sQxyg774aZ0cika5JY+4ZE5AQ9vpnfwezeDUEDVlqiq/XRYfKA+Aw/9lzim2zLP06WrHVp4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3172
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Aug 2022 08:11:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3122

Hi Jon,

On 8/22/22 17:38, Jon Mason wrote:
> numa is an existing machine feature, add it to the list so that users
> are aware of it.
> 

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Added back in 2018 with 830880a6888270e047271137f43a643b218050d4, so 
it's a candidate for backport to dunfell and kirkstone I would assume.

I am now wondering if there's some list of supported MACHINE_FEATURES or 
if the list is THAT one in the docs?

Cheers,
Quentin

