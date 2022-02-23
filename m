Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89230C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:46:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web12.7553.1645623990697458692
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 05:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ArVUIL3R;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.88,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmqoz+1luNm+85jlLNGECEJY+t6E3E0GzUSWUu+aA+Wvzwkq4tv63FcnyWqTMF7r6lTNun1XmrPhTWY0WwFhUhxlxE1f/q6gLRxveT0kqE6yMZzbf/5mWOc6UvsZO9Dy1xR+GUcxsl19VCJzjDPBZ3B8Yibi3tu1lqE214/Uy/pzchlnJi4MqCoUKneLdqOdCTVwdvubI1oZ14ZlRJl/YYuHyZ3PkKvZlX3kXrg1Be9rAWE0XnudzibdcBWSsWRMUCXyXxTSeOgo8mW2km8bsiOi+auOATMwCPkw6mWPl9P2QGuYbrmYPcBjuZJmR06tJ/k05ZWZ4EW6eYQtguT8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ3Ro4XabUw8UWuyT1Nz+92pVBRwOMyBivTAI0FHd8s=;
 b=RfUbF6bjhuQZ4vGgQgOzHByYdYGysBcqsSlWp1Slio3DpDk/olHtdbiXJy6Ry3sv5dKxzSn+MXvupwOraI7qKRY/IQNTOiZbKEYRV04jmHgSwdTK4DsQi8Q5zBOH803+N9RLkS58iaCahOgKz+6C/SEzqs+oE+Qlv8jQ3VPuO7T/rY638/n5CWI61v5igHLurV1Qa7SatxZSn8sLZDkaPK38f9RpjE9Fx3BQYsuCN8EBjLzXcNhx952juoWpoC63FJSP2Nc0anUrDZNJYboY59gLAEsXsN8epOApj202m0t6A3+eya4db1m5t7mO8aALfmOmG/tKi77339Wbo7RbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ3Ro4XabUw8UWuyT1Nz+92pVBRwOMyBivTAI0FHd8s=;
 b=ArVUIL3RG6VepU4cOz6ZHM0pYxuDOiPGO3t1c8GU5/Nkde7zO4ISToZa6Gs/0ku733ymkRSzabmRyZuZ93Y+QSwHCFvrI+U3ltg9Gx9Qf55K/1gaxO1yc235x/etoSCKDIDHxr9qsGtzJT/sOm57X6FrHAax/Rl544n4o9Zw+XA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DBBPR04MB7913.eurprd04.prod.outlook.com (2603:10a6:10:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Wed, 23 Feb
 2022 13:46:27 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%7]) with mapi id 15.20.5017.021; Wed, 23 Feb 2022
 13:46:27 +0000
Message-ID: <acd8aa9b-393a-e022-124f-804a6aa953a2@theobroma-systems.com>
Date: Wed, 23 Feb 2022 14:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH 1/2] docs: fix hardcoded link warning messages
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20220223105206.2766014-1-foss+yocto@0leil.net>
 <24a2b39e-0d85-5514-b7dd-48782b2a4d2d@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <24a2b39e-0d85-5514-b7dd-48782b2a4d2d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::35) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8eec0da-0305-422d-d9c0-08d9f6d2e3a3
X-MS-TrafficTypeDiagnostic: DBBPR04MB7913:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR04MB79134075BDE59D0E89B569B9C23C9@DBBPR04MB7913.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I+dM/YqAO3qhy9XcWplOo7RF+a8A9zQK8S1c9rpUvQwTFmHifqZTmL1GFv2anZWxV69n4R/D6Jk8qmjUhv01ffUokv7agd8SxgLkNubL8WyyIGaQ4gH9tMt2DTvlI9OSql0gJpFUesGB/BKNI/BzFhPCXPnO4F6zGIg5E2jVwK6PcPzAFEHysoNTJVerQrJquow5kW/MdT6Fb3PFVaouqwutra+hDTyZY2RAMdSj3n+ykfay3IFmkQz0VJ2DRyLX0Sbu68o9W7A3KXDZyzl+sRoH5BKByzCSFJ3LY2+kUD6qjWMHNTXDPWQHYExTIZZpX3HCqyL4JN0toLMM4IVRo8UYcIYzSv6NAspHG+pG7khXq+x2G3QyCgJ/ZrxxJY5dBa7fzHGlSMWV/7XfHrL/cOKAqI332G1+uwKGly0mT5YyAgl2azMhks0xYAOHccpNo06NnWZauWvhMBP2BptsIpDsMuMA/NvDDC2dT/HzG+aMt+gNBFTopfDCz/rDhuEQJm5ZogzlK1C9eUFZgPO+3jtaK1BkgoQ6hTzSn5Ow5D0U1C07giHZzQENsIsaBrcV9CrnDDoakf1OliOz00eb37xdjspj4mG+91vayAaViy1n+5dwT4e0oa3LMCbWyqYkupf1xhlApVF/vRnIPp1PWHZvTzHd689zIC23lSdEeSNXCZb1Y+jZUi9HNIOzjWD87qtsMmLDv9UZra9q54Mw10ZnTdxi3hXMpyrWZWoOOt4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(38100700002)(4744005)(44832011)(36756003)(83380400001)(8936002)(5660300002)(2906002)(31686004)(8676002)(53546011)(6486002)(186003)(26005)(508600001)(6512007)(66556008)(66946007)(66476007)(6506007)(2616005)(31696002)(86362001)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Uk8zK0F5emZQdnVNRThpOVpCcWFSMzNaTjRqQTNyYWlFL0hmRWZWMVRlNUJ6?=
 =?utf-8?B?SDQ2TVh0N1BFNUJaMlhuN0M0WDYrVUNpR3cwMlRMZWEvQzVmVk5BTVFXTENn?=
 =?utf-8?B?YzB5V1hOaUFsM1V1MlFjQmxueGdqdVdIQ1lhTEN5UE11VlB2UHQ3cWFhL0dY?=
 =?utf-8?B?K20yWk5iK094TjZMQ0VKa3FrbjZjeDA5OWt4ZDRlbTJsdzU0YVByTTB5YTNM?=
 =?utf-8?B?K0NoQzRUVW9FdElROXRkeFFaNEpaUVcwUE9pbUsyazIveVRWZHRtYy8xUFlh?=
 =?utf-8?B?dnZJeUFWS2VZUXhSUGZua1dhRlRCVEZ6Q3Z5bWFMUE1WcTVQYnR0dkxhaWlm?=
 =?utf-8?B?b1FTakN5Zkdwd3ZZUERSSW1IWGZRSkJyQlE0TUxrZGpjdGVyYlh4QVlwa3Vl?=
 =?utf-8?B?OXlROFdROERNK0VqT1VuMUVKQ3pkUGJndWY2WUhBYkl5RlRyOElrUEFJZm1v?=
 =?utf-8?B?SHN2OXF3eG5aV0dDVnJ0bWdXUk95T0pOTHVla1BtUTlaM25mQkJsYlVhY09R?=
 =?utf-8?B?ZzhVVjFGOEJNMEtzOFhXWkcrQ2dvWGtKUFRZellPdlhRLzFkRDUzcnFkbzFQ?=
 =?utf-8?B?U3hOMjhucTdJYkxUWXd0UUprNDBEYmR4T3Y0bkMvV3ZUNzBSUTRWUUR2ZE9T?=
 =?utf-8?B?ajVOMjQ0K3crT2Jkc05EaitXeXRZY1RLM1JHZzhFR25odU44MGo1R250UkRE?=
 =?utf-8?B?SDJsNkkwOXVsaGRVVHBRTlU4VVcraXJ2UWo3S2FYZjR5d0Z0SStSMGVoQXIy?=
 =?utf-8?B?ZHVvVFoycTZqR3R2QUVhUm1qVnlXZ2UzbVFaRjloN21lU2c2K3MwbDNrUmww?=
 =?utf-8?B?K1VDa0pXSFdmMUpWZXJjaHdBckpIVjducU1VTVE3cE01emcyQkVNQWpURXdr?=
 =?utf-8?B?Z09CaVMrbGFZRTN2MWZUcEUzTkZNMVNxek55ekdtTnNTZUZ6NXMvVWEwMlFS?=
 =?utf-8?B?OWpPMDViWmxVcVNud0VGdDVMVVVMRFVWQ2doSGhMWVRyeFFRYVJGQllFNmty?=
 =?utf-8?B?ZnBIbHdoU1Z0L1NvRUQ5STE0OWpFUjVRZjY4QUhJTXZTT05KWVJVSEorQys4?=
 =?utf-8?B?eWJmcWJlZDllOEJEcEhkcXZqdTBKTDdaWE5FeHhqeHlEWk9UbnlaMkMrZHBv?=
 =?utf-8?B?N0F2bVorOWJYaHJ5bTZqZ3ZQMW82d0c5TVVTdlFsQjRwaUpVTzYzdFV1T3Fn?=
 =?utf-8?B?RmhLOHgvMWFOTUtmbk11bFBDbjdFR0c2T3owbER1L0U0RUFRU2lMSW1TNmFW?=
 =?utf-8?B?NlJjN3VTTlhqand5ekJTNjVEWGt1bExYbjh6YjhCa1B4LzFtYUlEMFRmL01K?=
 =?utf-8?B?NjNMeEcxZmptZDBKNzZsUHhmQ3pqRFEwQlVmb0EvdWh6U0tIc2tEbDFmS2w5?=
 =?utf-8?B?WUI4OGJTOG1wZ21iZk04NXZUNnFMSCt6b2JxbHRLalB3Y2VQb2lSdG5kWFly?=
 =?utf-8?B?QWk5R2c1M0NIM3lranRRZkovVDBTR2hUS3gzVTZsRzgzYXVORnNpa1BUd2l1?=
 =?utf-8?B?T3NieXRSbVl4M0F5dGJjWll0S2x5QnoxbTlFZTVvZmsweDVNb1NyanZFRHFM?=
 =?utf-8?B?S05CaTZjWE10TncrNXB5OG52K3lmVEJEajNFWTRXdXc1cHlFUXdJZkc1QzUr?=
 =?utf-8?B?SUVNcm1MdmF1UGpETUxMVHpTRmRodTFQa1Mybk1mUVplY0JNT3E0NnRRNUw5?=
 =?utf-8?B?TS9vb0REdkh4YkVLSzJVVWE5aUlXbUFMZHdkNlVKd0tYQWJXaUJQSHdLY0FY?=
 =?utf-8?B?cEZZWEJuRE9QMGtKWk9vZTBGdHJJekl6aHVtV1RpODdCeFphVGZhbDFYaEh5?=
 =?utf-8?B?QmpQRnpkTmRRaDhEZjh1TWJxeUVrZFlxM2xRK3ZEd0drYWV0M2JOUnY5RCtM?=
 =?utf-8?B?ZS9PZi90eXhXdUJOYTZtbGNjbnZvUkRwQzFnYXRjczNuWmcvRCsyMlpWWlBm?=
 =?utf-8?B?Smt6TWZEckhqb2FhenNDVTFtQ3ZjcEtGbTYzbjVLb2lWaE02Zm9kU3J0ak1Z?=
 =?utf-8?B?MmVFRmFNa3cwU2daSjIyd3Eza2F3VGF5MWxDUTAyS2ExUFl3MU9leEw0MEpP?=
 =?utf-8?B?SUpubjl5VjNDNGxhZ0lTdVA1dXo0MzJGNFJQTGtyVkY1OW5ranJkRmtVM3RU?=
 =?utf-8?B?d2UwZnhBY2RZeGpMK0dnU2dHdTNaWmtsbThEUkVGVWRjd2UyVjZxeitTN1RK?=
 =?utf-8?B?dWpkWEpNQ05QK1FEVUtZSUtmNFFZK0kxYkRZWjhsaFpvVk92T2FrdnRWMkcx?=
 =?utf-8?B?MkVxVlRuRTdWc2V6cDBxQnJTU0ZDNnZQYlJLNUxZT0Z4b0svZmU2TlVMSXk3?=
 =?utf-8?B?TzNIWGJDbUIwRmVVdXBPSXNWSDBMdDY2Wm9UOUw3elBTV0x4bnAzZz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8eec0da-0305-422d-d9c0-08d9f6d2e3a3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 13:46:27.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4kmDnzrbzQn2jSaC8TzjOCE0eCuYspg5lxsAXDtMDE+G4c+dt+PUmqFlMgPvxyD0qLFSn8lJWnhUra0i6xRmznUE1Py2DRYzUIuo8XVwh6jNPv8ewNtZru3kkYaAIe2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7913
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 13:46:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2494

Hi Michael,

On 2/23/22 14:34, Michael Opdenacker wrote:
> Hi Quentin,
> 
> On 2/23/22 11:52, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> Sphinx complains about hardcoded links which can be replaced by an
>> extlink.
>>
>> So let's apply its recommendations.
> 
> 
> Many thanks for the fixes!
> I wonder how you got those while I didn't. Which version of Sphinx do
> you have? I have version 4.2.
> 

$ sphinx-build --version
sphinx-build 4.4.0

Cheers,
Quentin

