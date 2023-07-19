Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B438DEB64DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 02:39:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5502.1689734341211534189
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 19:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Lgtgp70q;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689734341; x=1721270341;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rqIIM2xIoRBvIacSk+gqRmPW8QMfX4272L+xYLCIcMk=;
  b=Lgtgp70qXpyy9vRyEXwBEwN0qmIEMEQmjjosb7I4dC82oO6KW4SR7Keh
   6itqZUQtsyeJy2z9gmRXjzBrMeuZxRdZ0DxuawZFNHdqEnstZVBw7bTKb
   zFogyXS82NP/2jhKv46Fv/nvtWlFg0ea/5+NG5XCGDzQF8SmGCSnORS9f
   BDw/LSFwGpoYHNYjsb8WVhsR2Y8g25QFilKSU0+P5bqsHaj04JwxFEy1J
   O/MhvfOrip6AzYxGwhJpDXfrvIYh13j1H8McuNnvS/meliyS6jzMsFmNc
   JdgzmFrdGvj+Sid/56MTeNfdTnNNOeXzK6gPEAlcwCuh3hF12DQ0UNjrV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="363815498"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="363815498"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="897755893"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="897755893"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP; 18 Jul 2023 19:38:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 19:38:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 19:38:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 19:38:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 19:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/qqEmRNBn6O3ilmNWCOZN2TN0GHfnzXh8fTrSiEz223YvJgXIJIBBFrRoxRPJPN3cl5nepOLtHAI7QmVNow4Y9OEhONUFTONXrMwuv/Bw3RfcJQ3ckP47XT02pJEgOXYw2qOcDRerH9t/zlsTCk3J1Q9VNGaZhyo+FUBSXqoLJvSPL4uPbKsYz3YEIojJFyd3F9F8nL7I4N8cThnRIEAj9O2gAsJ/3okOIVWhS/OxF0L/jQrf1FMfJ6CMRgpmrqK4TLGXUCT/Hz28C3H/oi111M+n8asUaoT0K8UAqAs0Y5W6I12qExmDQhDNazUOMGpdnGyXZQcI6qzf4lN3Dm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqIIM2xIoRBvIacSk+gqRmPW8QMfX4272L+xYLCIcMk=;
 b=Hw04c0rmhm2/qZml+LzX2gKRS8p6RBM1/+C/YyFhTCBLXC/kBSTjTB2RksAbPugKifOAebdInIAx/ChZNLFeua+8nsQ2kkX/RSUYyyOanGMd+DvoMAgBNQK8mD2iwG3/w7ueyCBjNTcYeluk+9ANszsJKdvd+MwuVEIUsBvTsU1XjbeIav97e/XmaIRhFAnBtV6kxZqHKUUw7K8XS78ombB53GB3ESVquOcoQEFysgHQJ03RTqgAEoAeTRPw7XAUuvh/vFTxhWJvUrvjsP6lobcaXM4xvf//KUEyLW1AOYzk5Qi2jFHVoQ6ZmfyJM1PPMVvTu9Q+F60DdrEkYsjGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 by IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 02:38:57 +0000
Received: from CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::2245:151d:2cf4:c5f9]) by CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::2245:151d:2cf4:c5f9%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 02:38:57 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: RE: [yocto] [ANNOUNCEMENT] Yocto Project 4.0.11 is Released
Thread-Topic: [yocto] [ANNOUNCEMENT] Yocto Project 4.0.11 is Released
Thread-Index: AdmtwJjE8lJylhPDRA2C2K9dENALJgLtMpiAABzcp4A=
Date: Wed, 19 Jul 2023 02:38:56 +0000
Message-ID: <CH3PR11MB8093F5BF2398A84BF563ED9FB939A@CH3PR11MB8093.namprd11.prod.outlook.com>
References: <CH3PR11MB8093282D366825D9D00DB9BFB92EA@CH3PR11MB8093.namprd11.prod.outlook.com>
 <9262f63a-ad4f-4842-076e-351030608db3@bootlin.com>
In-Reply-To: <9262f63a-ad4f-4842-076e-351030608db3@bootlin.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8093:EE_|IA1PR11MB6418:EE_
x-ms-office365-filtering-correlation-id: 22614f9a-260e-4faa-b5f7-08db88014cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aURU0Q9Z0jFMv+GZy0Cag2mbva3a85bYyYKHJFWykygC5vSus5dCfVX82m3qVVGP90Z7ZBuvxmn9scQSj4WBKAsn6N1JJsxzXgnMBYb2ubBB+ZluuCxioQ6lwA+Ha1XKXImVpxhfSV4b6pSMUB3zu6dH2p2b7lKnJkG/EAce/LcrBqwliAwtnCi63+H4rcOJu7HTStg3UBaDvtMmxldrnc3OXX919HydNQbRo/74hX/1ONuOjZYSjdah/lqCktykdp8juO48NKuRwdXjsQEY81OcIJaHVi/uNyJjeC/wQulgtYAaKfdxhosRZekASuVd3BNXSEJgVCbgpF128xJu4qEXWWZJauxbR+GLpWEbadB8ZuXzBnB1vQLs2TP/SpcsC0yljR1uIZdpZieoVfjvwKsNg8kpV2TYLQNjo/8wAVq7R7TefRCMb1Hewv5iO8+/n/IchtRxMQiCzSrSwvmo/KDLcJ7H5O1+/lYqwNQ5evkalMSXu0lnRvcAz5fdoDhuKS6sKctgC4Et1ACo/7QeZtTVcq+6f3fXOXlj99U+O2O4bSEpCprs5PE9CmtvI5d2Zliyc0o+rqo4ZxlAqhNChLz9YRo9gUzelw+dr6CPyx4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199021)(7696005)(71200400001)(478600001)(83380400001)(38070700005)(33656002)(86362001)(55016003)(4744005)(2906002)(76116006)(6506007)(186003)(966005)(9686003)(38100700002)(122000001)(82960400001)(66476007)(64756008)(66946007)(66446008)(41300700001)(66556008)(4326008)(316002)(6916009)(8676002)(5660300002)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFpndEw1VXA5d2ZjbUkrL3JITmJVclRzSXdxYU5iU0RmVUZyd3VhajhZNTQz?=
 =?utf-8?B?dDJtVjJ2MHJ6aCsrSWNiVUFleDh0U3BMYUw5V0ZTd3IyRnJuc0p6OEdYUXZl?=
 =?utf-8?B?SVdiZUZQN0QzeU50eDllL3B5cTQwU2llVlY1eVNKQ3A0OXJhSDRmUXFDVWRN?=
 =?utf-8?B?dGFaTWtxOVN0Q1R0RCtBTys0YUZhZ1BZNHRJSmlyajIwbFpSbHJKSEZ2aG8w?=
 =?utf-8?B?K1h6RUQvbEpROHd2NVlaTHVtZUgrS051SDlpS1B4T0w2M1V1c1g0azU2ckhn?=
 =?utf-8?B?Tk8wNDZjT3JFWGhQSGJTRWNPMThFeWZwSU10anE0c0ZCRkx0WFFiUzVxVzZZ?=
 =?utf-8?B?Q0V1aU5pQ2V4RnFHOWFOazZQUXM1VTBvcEhPVXd2VXlVUnJId0Q0MXFsY01t?=
 =?utf-8?B?OEh4c2pwcDlCQVFuaXRPSGRMTlVXcGNOWnVhVEJBa3l3RTFtUVU5ODhDRXF4?=
 =?utf-8?B?UFZ5Q09INCtSWFRRRTVkZU9FUkVpb0dqR2VUMVhzRy9NQWZVVnJjMFpNOGdU?=
 =?utf-8?B?RFBjbndFdVlWU29oSjVpblNMMHE2NEFEa1pjUEduUkw1Y2VPQk9lbHZuZGg1?=
 =?utf-8?B?YTJOZ0c5Y1MzMUFEMDFkL2I4TXVPQkZsQ1hyekVQalVDczBzZ09CeVZqSm5r?=
 =?utf-8?B?U0IwZC9FdmZ4OUY2RmJwdW4xTEJFVU5kNjRpOEllVFhQcEQ5K0tZZ0x0ZkMy?=
 =?utf-8?B?NGFMMWlkWUF4WDdDREtGY3Izam1mZS9lU0VvbzJZUTNQaVdQQVJMTTRNU3lp?=
 =?utf-8?B?cVcxdnozSlIyelVUNnpMK1BySXovWmhyQWc2RXNCc1hvOVlHZUZKaGR5alE0?=
 =?utf-8?B?VHFPUzNrdDlObi80SUJaUlBsalBjUlJXRkNNMFJDWFFGVVc0MDBidkplNERE?=
 =?utf-8?B?SXROOTJoY0djQzJGWk41dkVTNk55Qm9rRHdST0ZZNHZUeHNacGxhYjJVUmoy?=
 =?utf-8?B?TStWWkVWcm52dHhaM1JOZEJoVTNtSUhnT2ZuVTFSS3dSTy9XOVZyd29DVXBX?=
 =?utf-8?B?WW4vaEVTcTdzR0drVmwxVDZuNGNoa29Pb0hYcjNIazVja2pLd1NjNndzdTMz?=
 =?utf-8?B?ZnhOVFVqY0pLVFBSMlR6cWhZbjlCdEk2VHdTUkhEQ1FUWC9zR0MvTVZXUjBm?=
 =?utf-8?B?am9VOXN3YkwxcmNKNldRbFU1UllpVzU4dTN3V1ZMYjRuRFdCWW8wdDVlbUlz?=
 =?utf-8?B?d1k0S3E0QUVVWkVWV1lxTXZLdGFWZzdXdVF3YWZVUkczZk15ZGpubmNScXpK?=
 =?utf-8?B?TVpQQlFKMHRkRmFaSGp5Szg4cDJXNnk5N1dsam15Q3U3eUp6VnBBUmxqckhG?=
 =?utf-8?B?K0c0ZGFwb1FBWTlWYWpjZzZqSjZHR2Z2RlFzalA4OG5OQ3RWRGx4M3piR1hF?=
 =?utf-8?B?a1gzcnA5WU5QZTBuc3lKWlZBdFhDRWtUMFQxNURTb2o3Vkp6aUNFRmxtbnVk?=
 =?utf-8?B?NjVicDQ0bDJtNXVJSVgvWUZlTUdzL2ZjT3BKZVhjSXBnM1FzNEhVRE14RFdC?=
 =?utf-8?B?NENFb0R4TnJwRzlpSWgySjdoZWpaVmVVN0pBOGM1bmVlMGRGU3pQM21RZWdp?=
 =?utf-8?B?QmFjMzFyWHE3WmpMWWZyek92YnVNeGhrWkNNT291Q0tTRll6Nyt5cmJjQ3lL?=
 =?utf-8?B?YUJaZlRHdmJtdnBWRUhSZVBNYWdUM3hCM3VLbG01WjZvNHN1aU01SDVmZVlY?=
 =?utf-8?B?R2dvNS9KWjFoY0c0eTRVTFVudlB2R2E5eGNjSU9qL0VpS2U4ZWVXN2ZpRGRl?=
 =?utf-8?B?M0VYZjV1bTRxRTFVUGZuTURNcHJMK3Q4U1JmK0M1UEJjZENsWXVieW5xeHZE?=
 =?utf-8?B?RkJnM2p3Slcxd0xuRkI1NUlnMSs3aFpzbklmK2hIc0NmVlJsekkyYnlvTUdD?=
 =?utf-8?B?WWxUaHQ5dzlBdXRzK2tIT3g3Y0F0VDlNZjNVM3FBZWpWZlhUdG16cWtiUURS?=
 =?utf-8?B?RXM0MnJqR2lQNGxYZlhaQVREcnk3MkVmN3IxZjE5VlVaeER5ZjJkaWdaM3pr?=
 =?utf-8?B?QUllYUR2bkNQVmFpTE5RMWZlWUEzMnRGNXNVbElpNUkvMG81VXQ5dDEyTDBq?=
 =?utf-8?B?YlZYTE5yTkF4MGdVWG9MaFFkeXV5UERvd3RTamc2SElDQWl3V0VnVUFsTVZl?=
 =?utf-8?B?MjRJS2NIVG4reVdMa3hMd012ZFNncFF0bXFCLys0NjhacC8yYUtiY1ZmK0ov?=
 =?utf-8?Q?HrSn/GiVZn+7N0NV82v2IHFgbUybV/AWJfBELKlubzJY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22614f9a-260e-4faa-b5f7-08db88014cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 02:38:56.6804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhPABMvIQmFXaJPBN0KQWAW2OOEAK0OFJIsc2DgMIXALYweCk/CMfgd2+KRURiBsMnmRv3LmpZ25boZ0DHyllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
X-OriginatorOrg: intel.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Jul 2023 02:39:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4060

PiA+DQo+ID4gLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4geW9jdG8tNC4w
LjExIFJlbGVhc2UgTm90ZXMNCj4gPg0KPiA+IC0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmVsZWFzZSEgRG9uJ3QgeW91IGhhdmUgdGhlIHJl
bGVhc2Ugbm90ZXMgaW4gcnN0IGZvcm1hdCBhcyB3ZWxsPw0KPiBJIGNhbiBtYWtlIHRoZW0gZnJv
bSB0aGUgdGV4dCB2ZXJzaW9uLCBidXQgeW91ciBzY3JpcHRzIGFyZSBwcm9iYWJseSBtb3JlDQo+
IGVmZmljaWVudC4uLg0KDQpZZWFoLCAgSSBwcmVwYXJlZCBpdCwgIGZvcmdvdHRlbiB0byBzZW5k
IG91dCBhZnRlciB0aGUgYW5ub3VuY2VtZW50LiANClRoYW5rIGZvciB0aGUgcmVtaW5kZXIuICAN
Cg0KDQo+IA0KPiBUaGFua3MgaW4gYWR2YW5jZQ0KPiBDaGVlcnMNCj4gTWljaGFlbC4NCj4gDQo+
IC0tDQo+IE1pY2hhZWwgT3BkZW5hY2tlciwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

